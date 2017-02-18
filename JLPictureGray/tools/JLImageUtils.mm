//
//  JLImageUtils.m
//  JLPictureGray
//
//  Created by afyylong on 2017/2/9.
//  Copyright © 2017年 afyylong. All rights reserved.
//

#import "JLImageUtils.h"

//导入头文件
#import <opencv2/opencv.hpp>//头
#import <opencv2/imgcodecs/ios.h>//iOS图像处理
//导入命名空间（使用到c++）
using namespace cv;

@implementation JLImageUtils

#pragma mark - opencv
+ (UIImage *)imageToGrayImage:(UIImage *)image {
    
    //1.将iOS的image转成C++图片（矩阵）
    Mat mat_image_normal;
    UIImageToMat(image, mat_image_normal);
    
    //2.将C++彩色图片转成灰度图片
    Mat mat_image_gray;
    /**
     参数1：数据源
     参数2：目标数据
     参数3：转换类型
     */
    cvtColor(mat_image_normal, mat_image_gray, COLOR_BGR2GRAY);
    
    //3.灰度转换成正常的图片
    cvtColor(mat_image_gray, mat_image_normal, COLOR_GRAY2BGR);

    //4.转换成iOS可见的图片
    UIImage *img = MatToUIImage(mat_image_normal);
    
    return img;
}

#pragma mark - 系统方式
+ (UIImage *)systemImageToGrayImage:(UIImage *)image {
    int width = image.size.width;
    int height = image.size.height;
    //1.创建颜色空间（开辟一块颜色内存）
    //图片灰度处理
    CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceGray();
    
    //2.颜色空间上下文（保存图像数据信息）
    
    /**
     上下文空间
     参数1： data 内存地址
     参数2 width  内存宽（图片宽）
     参数3 height  内存高（图片高）  
     参数4 bitsPerComponent  像素位数（颜色空间，eg:32位像素格式和RGB颜色空间8位）  
     参数5 bytesPerRow  图片每一行占用内存比特数  
     参数6 space  颜色空间  
     参数7 bitmapInfo 图片是否包含透明度通道  
     返回 CGContextRef
     */
    CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, 0, colorRef, kCGImageAlphaNone);
    //释放内存
    CGColorSpaceRelease(colorRef);
    
    if (context == nil) {
        return nil;
    }
    //3.渲染图片（在内存区绘制图片）
    /**
     参数1:上下文
     参数2：渲染区域
     参数3：源文件图片
     */
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image.CGImage);
    
    //4.将绘制颜色空间转成CGImage(转成图片类型)
    CGImageRef grayImageRef = CGBitmapContextCreateImage(context);
    
    //5.将C/C++图片CGImage转成面向对象的UIImage
    UIImage *img = [UIImage imageWithCGImage:grayImageRef];
    //释放内存
    CGContextRelease(context);
    CGImageRelease(grayImageRef);
    
    return img;
}


























@end
