//
//  CAKeyframeAnimationVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CAKeyframeAnimationVc.h"
#import "CAKeyfromeAnimationView.h"

@implementation CAKeyframeAnimationVc


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"关键帧动画演示";
    
    UIView *subView = [[CAKeyfromeAnimationView alloc] initWithFrame:self.view.bounds];
    subView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:subView];
    
    
    UILabel *notice = [[UILabel alloc] initWithFrame:CGRectMake(20, 64, [UIScreen mainScreen].bounds.size.width, 30)];
    notice.text = @"*在空白处画出路径，松开手即看见动画";
    notice.textColor = [UIColor lightGrayColor];
    notice.font = [UIFont systemFontOfSize:12];
    [subView addSubview:notice];
    
}


@end
