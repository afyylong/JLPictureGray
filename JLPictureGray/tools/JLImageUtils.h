//
//  JLImageUtils.h
//  JLPictureGray
//
//  Created by afyylong on 2017/2/9.
//  Copyright © 2017年 afyylong. All rights reserved.
//  图片处理类
//   |升级
//   ↓ strategy
//  策略模式：一个类中有相同功能目的的算法（一人只会系统的方法，一个人只会使用opencv方式，如果放在同一个类中两个人来修改的话很容易引起冲突）,可以单独定义，便与扩展。我们将算法分离

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JLImageUtils : NSObject

#pragma mark - opencv
/**
 opencv 图片转灰度图片

 @param image 源图片
 @return 灰度图片
 */
+ (UIImage *)imageToGrayImage:(UIImage *)image;

#pragma mark - 系统的方法
/**
 iOS 系统方法 图片转灰度

 @param image 源图片
 @return 灰度图片
 */
+ (UIImage *)systemImageToGrayImage:(UIImage *)image;


@end
