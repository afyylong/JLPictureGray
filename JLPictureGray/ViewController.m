//
//  ViewController.m
//  JLPictureGray
//
//  Created by afyylong on 2017/2/9.
//  Copyright © 2017年 afyylong. All rights reserved.
//

#import "ViewController.h"
#import "JLImageUtils.h"
#import "SystemStrategy.h"
#import "OpencCVStrategy.h"

@interface ViewController ()

@property(nonatomic) id<Strategy> utils;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _utils = [[OpencCVStrategy alloc] init];
}

#pragma mark 正常转灰度
- (IBAction)normalToGray:(UIButton *)sender {
    
//   UIImage *img = [JLImageUtils systemImageToGrayImage:_imgView.image];
    UIImage *img = [_utils imageToGrayImage:_imgView.image];
//   UIImage *img = [OpencCVStrategy imageToGrayImage:_imgView.image];
    _imgView.image = img;
}

#pragma mark 灰度转正常
- (IBAction)grayToNormal:(UIButton *)sender {
    
    _imgView.image = [UIImage imageNamed:@"img.png"];
}




@end
