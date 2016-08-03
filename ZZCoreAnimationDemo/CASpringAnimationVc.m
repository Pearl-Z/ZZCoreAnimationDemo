//
//  CASpringAnimationVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CASpringAnimationVc.h"
#import "CALayer+ZZAnimation.h"

@interface CASpringAnimationVc ()

@property(nonatomic,strong) CALayer *imageLayer;

@end

@implementation CASpringAnimationVc



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageLayer = [CALayer layer];
    // 设置该CALayer的边框、大小、位置等属性
    _imageLayer.cornerRadius = 6;
    _imageLayer.borderWidth = 1;
    _imageLayer.borderColor = [UIColor blackColor].CGColor;
    _imageLayer.masksToBounds = YES;
    _imageLayer.allowsEdgeAntialiasing = YES;
    _imageLayer.frame = CGRectMake(50, 200, 100, 135);
    // 设置该imageLayer显示的图片
    _imageLayer.contents = (id)[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"img1" ofType:@"jpeg"]] CGImage];
    [self.view.layer addSublayer:_imageLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     NSLog(@"%@",[NSValue valueWithCGRect:_imageLayer.frame]);
    [_imageLayer zz_springAnimationWithMass:1 stiffness:100 damping:5 initialVelocity:0 basicAnimationType:ZZBasicAnimationTypeTranslation coordinates:ZZCoordinatesMake(150, 0, 0) angle:0 completedBlock:^(BOOL flag) {
        NSLog(@"%@",[NSValue valueWithCGRect:_imageLayer.frame]);
    }];
    _imageLayer.transform = CATransform3DIdentity;
    
}

@end
