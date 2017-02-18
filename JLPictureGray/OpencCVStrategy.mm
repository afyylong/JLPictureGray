//
//  OpencCVStrategy.m
//  JLPictureGray
//
//  Created by afyylong on 2017/2/12.
//  Copyright © 2017年 afyylong. All rights reserved.
//

#import "OpencCVStrategy.h"
//导入头文件
#import <opencv2/opencv.hpp>//头
#import <opencv2/imgcodecs/ios.h>//iOS图像处理
//导入命名空间（使用到c++）
using namespace cv;

@implementation OpencCVStrategy

#pragma mark - opencv
- (UIImage *)imageToGrayImage:(UIImage *)image {
    
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

@end
