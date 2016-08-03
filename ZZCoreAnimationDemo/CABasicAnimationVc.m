//
//  CABasicAnimationVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CABasicAnimationVc.h"
#import "CALayer+ZZAnimation.h"

@interface CABasicAnimationVc ()

@property(nonatomic,strong) CALayer *imageLayer;
@property(nonatomic,assign) BOOL isAnimating;

@end

@implementation CABasicAnimationVc

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"基本动画示例";
    
    
    NSArray* bnTitleArray = [NSArray arrayWithObjects:@"位移"
                             , @"旋转" , @"缩放", nil];
    // 获取屏幕的内部高度
    CGFloat totalHeight = [UIScreen mainScreen].bounds.size.height;
    NSMutableArray* bnArray = [[NSMutableArray alloc] init];
    // 采用循环创建4个按钮
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width/bnTitleArray.count;
    for(int i = 0 ; i < bnTitleArray.count; i++)
    {
        UIButton* bn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        bn.frame = CGRectMake(i * btnW, totalHeight - 45 - 20 , btnW , 35);
        [bn setTitle:[bnTitleArray objectAtIndex:i]
            forState:UIControlStateNormal];
        [bnArray addObject:bn];
        [self.view addSubview:bn];
    }
    // 为4个按钮绑定不同的事件处理方法
    [[bnArray objectAtIndex:0] addTarget:self action:@selector(move:)
                        forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:1] addTarget:self action:@selector(rotate:)
                        forControlEvents:UIControlEventTouchUpInside];
    [[bnArray objectAtIndex:2] addTarget:self action:@selector(scale:)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)move:(id)sender
{
    if (_isAnimating) {
        return;
    }
    _isAnimating = YES;
    [self.imageLayer zz_basicAnimationWithType:ZZBasicAnimationTypeTranslation duration:1.0 coordinates:ZZCoordinatesMake(20, 20, 0) angle:30 completedBlock:^(BOOL flag) {
        _isAnimating = NO;
    }];
    
}

- (void)rotate:(id)sender
{
    if (_isAnimating) {
        return;
    }
    _isAnimating = YES;
    [self.imageLayer zz_basicAnimationWithType:ZZBasicAnimationTypeRotation duration:1.0 coordinates:ZZCoordinatesMake(0, 0, 1) angle:30 completedBlock:^(BOOL flag) {
        _isAnimating = NO;
    }];
    
}

- (void)scale:(id)sender
{
    if (_isAnimating) {
        return;
    }
    _isAnimating = YES;
    [self.imageLayer zz_basicAnimationWithType:ZZBasicAnimationTypeScale duration:1.0 coordinates:ZZCoordinatesMake(1.2, 1.2, 1.0) angle:30 completedBlock:^(BOOL flag) {
        _isAnimating = NO;
    }];
}



@end
