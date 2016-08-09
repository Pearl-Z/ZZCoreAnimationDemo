//
//  CAEmitterLayerVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/8/9.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "UIEffectDesignerVc.h"

#import "UIEffectDesignerView.h"

@interface UIEffectDesignerVc ()

@property(nonatomic, weak) UIEffectDesignerView *effView;

@end

@implementation UIEffectDesignerVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIEffectDesignerView *dView = [UIEffectDesignerView effectWithFile:@"Untitled.ped"];
    dView.frame = self.view.bounds;
    dView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:dView];
    self.effView = dView;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [dView addGestureRecognizer:pan];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.title = @"粒子动画";
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint p = [pan locationInView:pan.view];
    _effView.emitter.emitterPosition = p;
    
    [pan setTranslation:CGPointZero inView:pan.view];
}



@end
