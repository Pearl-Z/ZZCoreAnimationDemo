//
//  CAEmitterLayerVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/8/9.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CAEmitterLayerVc.h"

@interface CAEmitterLayerVc ()

@end

@implementation CAEmitterLayerVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"粒子效果";
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"spark.png"].CGImage;
    cell.birthRate = 500;
    cell.lifetime = 0.5;
    cell.lifetimeRange = 0.3;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.2;
    cell.velocity = 500;
    cell.velocityRange = 100;
    cell.emissionRange = M_PI/20;
    cell.emissionLongitude = M_PI*7/4;
    
    CAEmitterCell *subCell = [[CAEmitterCell alloc] init];
    subCell.contents = (__bridge id)[UIImage imageNamed:@"spark.png"].CGImage;
    subCell.birthRate = 5;
    subCell.lifetime = 0.5;
    subCell.lifetimeRange = 0.3;
    subCell.color = [UIColor colorWithRed:255/255.0 green:106/255.0 blue:106/255.0 alpha:1.0].CGColor;
    subCell.velocity = 0;
    subCell.velocityRange = 50;
    subCell.emissionRange = M_PI;
    subCell.emissionLongitude = -M_PI/4;
    
    cell.emitterCells = @[subCell];
    
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    emitter.masksToBounds = YES;
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(200, 260);
    emitter.emitterCells = @[cell];
    emitter.emitterShape = kCAEmitterLayerCircle;
    emitter.emitterSize = CGSizeMake(200, 200);
    emitter.emitterMode = kCAEmitterLayerOutline;
    emitter.velocity = 1.0;
    [self.view.layer addSublayer:emitter];
}


@end
