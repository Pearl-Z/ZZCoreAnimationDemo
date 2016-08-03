//
//  CAKeyfromeAnimationView.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/8/3.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CAKeyfromeAnimationView.h"
#import "CALayer+ZZAnimation.h"

@interface CAKeyfromeAnimationView()

@property(nonatomic,strong) CALayer *imageLayer;

@property(nonatomic,strong) UIBezierPath *path;


@property(nonatomic,assign) BOOL cleanContext;

@property(nonatomic,strong) CAShapeLayer *lineLayer2;

@end


@implementation CAKeyfromeAnimationView

- (CAShapeLayer *)lineLayer2{
    if (!_lineLayer2) {
        _lineLayer2 = [CAShapeLayer layer];
        _lineLayer2.frame = self.bounds;
        _lineLayer2.strokeColor = [UIColor redColor].CGColor;
        _lineLayer2.fillColor = [UIColor clearColor].CGColor;
    }
    return _lineLayer2;
}

- (CALayer *)imageLayer{
    if (!_imageLayer) {
        // 创建一个CALayer对象
        _imageLayer = [CALayer layer];
        // 设置该CALayer的边框、大小、位置等属性
        _imageLayer.cornerRadius = 20;
        _imageLayer.borderWidth = 1;
        _imageLayer.borderColor = [UIColor blackColor].CGColor;
        _imageLayer.masksToBounds = YES;
        _imageLayer.allowsEdgeAntialiasing = YES;
        _imageLayer.frame = CGRectMake(30, 30, 40, 40);
        // 设置该imageLayer显示的图片
        _imageLayer.contents = (id)[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"img1" ofType:@"jpeg"]] CGImage];
        [self.layer addSublayer:_imageLayer];
    }
    return _imageLayer;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    _path = [UIBezierPath bezierPath];
    [_path moveToPoint:[touch locationInView:self]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    [_path addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 添加路径动画
    [_lineLayer2 removeFromSuperlayer];
    _lineLayer2 = [self.layer zz_drawPathAnimationWithPath:_path lineWidth:1 lineColor:[UIColor orangeColor].CGColor duration:5 completedBlock:^(BOOL flag) {
    }];
    [self.layer insertSublayer:_lineLayer2 below:self.imageLayer];
    
    // 添加关键帧动画
    [self.imageLayer zz_keyframeAnimationWithPath:_path duration:5 completedBlock:^(BOOL flag) {
    }];

    
    // 清除context
    self.cleanContext = YES;
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    // 画路径
    [[UIColor orangeColor] set];
    _path.lineWidth = 1;
    [_path stroke];
    
    // 清除context
    if (self.cleanContext) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextClearRect(ctx, rect);
        CGContextSetFillColorWithColor(ctx, self.backgroundColor.CGColor);
        CGContextFillRect(ctx, rect);
    }
    self.cleanContext = NO;
}

@end
