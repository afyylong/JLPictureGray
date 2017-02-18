//
//  Strategy.h
//  JLPictureGray
//
//  Created by afyylong on 2017/2/12.
//  Copyright © 2017年 afyylong. All rights reserved.
//  策略协议

#import <UIKit/UIKit.h>


@protocol Strategy <NSObject>


//定义算法
- (UIImage *)imageToGrayImage:(UIImage *)image;




















@end
