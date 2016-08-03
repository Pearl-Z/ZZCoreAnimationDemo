//
//  CATransitionVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CATransitionVc.h"
#import "CALayer+ZZAnimation.h"

@interface CATransitionVc()

@property(nonatomic,strong) UIImageView  *imgView;

@property(nonatomic,assign) int index;

@property(nonatomic,assign) BOOL isAnimating;

@end

@implementation CATransitionVc

- (void)setIndex:(int)index{
    if (index <= 0) {
        _index = 3;
    }else if (index > 3){
        _index = 1;
    }else{
        _index = index;
    }

    NSString *imgName = [NSString stringWithFormat:@"img%d",_index];
    self.imgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imgName ofType:@"jpeg"]];
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"转场动画示例";
    self.imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.imgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imgView];
    self.index = 1;
   
    [self animation];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animation];
}


- (void)animation{
    if (_isAnimating) {
        return;
    }
    self.index += 1;
    _isAnimating = YES;
    int type = arc4random_uniform(12);
    int subtype = arc4random_uniform(4);
    [self.imgView.layer zz_animationTransType:type duration:arc4random_uniform(15)/10.0 + 0.5 subType:subtype completedBlock:^(BOOL flag) {
        _isAnimating = NO;
    }];
}



@end
