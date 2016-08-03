//
//  CAAnimationGroupVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CAAnimationGroupVc.h"
#import "CALayer+ZZAnimation.h"

@interface CAAnimationGroupVc()

@property(nonatomic,strong) CALayer *imageLayer;
@property(nonatomic,assign) BOOL isAnimating;

@end

@implementation CAAnimationGroupVc

- (CALayer *)imageLayer{
    if (!_imageLayer) {
        // 创建一个CALayer对象
        _imageLayer = [CALayer layer];
        // 设置该CALayer的边框、大小、位置等属性
        _imageLayer.cornerRadius = 6;
        _imageLayer.borderWidth = 1;
        _imageLayer.borderColor = [UIColor blackColor].CGColor;
        _imageLayer.masksToBounds = YES;
        _imageLayer.allowsEdgeAntialiasing = YES;
        _imageLayer.frame = CGRectMake(30, 30, 100, 135);
        // 设置该imageLayer显示的图片
        _imageLayer.contents = (id)[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"img1" ofType:@"jpeg"]] CGImage];
        [self.view.layer addSublayer:_imageLayer];
    }
    return _imageLayer;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"动画组示例";
    self.view.backgroundColor = [UIColor whiteColor];
    [self animation];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animation];
}

- (void)animation{
    
    if (_isAnimating) {
        return;
    }
    
    CGPoint fromPoint = self.imageLayer.position;
    CGPoint toPoint = CGPointMake(280 , fromPoint.y + 300);
    // 创建不断改变CALayer的position属性的属性动画
    CABasicAnimation* moveAnim = [CABasicAnimation
                                  animationWithKeyPath:@"position"];
    // 设置动画开始的属性值
    moveAnim.fromValue = [NSValue valueWithCGPoint:fromPoint];
    // 设置动画结束的属性值
    moveAnim.toValue = [NSValue valueWithCGPoint:toPoint];
    moveAnim.removedOnCompletion = YES;
    // 创建不断改变CALayer的transform属性的属性动画
    CABasicAnimation* transformAnim = [CABasicAnimation
                                       animationWithKeyPath:@"transform"];
    CATransform3D fromValue = self.imageLayer.transform;
    // 设置动画开始的属性值
    transformAnim.fromValue = [NSValue valueWithCATransform3D: fromValue];
    // 创建缩放为X、Y两个方向上缩放为0.5的变换矩阵
    CATransform3D scaleValue = CATransform3DScale(fromValue , 0.5 , 0.5, 1);
    // 绕Z轴旋转180度的变换矩阵
    CATransform3D rotateValue = CATransform3DRotate(fromValue, M_PI , 0 , 0 , 1);
    // 计算两个变换矩阵的和
    CATransform3D toValue = CATransform3DConcat(scaleValue, rotateValue);
    // 设置动画技术的属性值
    transformAnim.toValue = [NSValue valueWithCATransform3D:toValue];
    // 动画效果累加
    transformAnim.cumulative = YES;
    // 动画重复执行2次，旋转360度
    transformAnim.repeatCount = 2;
    transformAnim.duration = 3;
    
    // 位移、缩放、旋转组合起来执行
    // 为imageLayer添加动画
    _isAnimating = YES;
    [self.imageLayer zz_animationGroupWithAnimations:@[moveAnim,transformAnim] duration:6 completedBlock:^(BOOL flag) {
        _isAnimating = NO;
    }];
}




@end
