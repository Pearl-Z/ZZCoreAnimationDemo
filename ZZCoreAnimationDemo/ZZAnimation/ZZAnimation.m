//
//  ZZAnimation.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "ZZAnimation.h"

@implementation ZZAnimation

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end



@implementation ZZTransition : CATransition

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end


@implementation ZZAnimationGroup : CAAnimationGroup

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end


@implementation ZZPropertyAnimation : CAPropertyAnimation

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end


@implementation ZZBasicAnimation : CABasicAnimation

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end

@implementation ZZKeyframeAnimation : CAKeyframeAnimation

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end


@implementation ZZSpringAnimation : CASpringAnimation

- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completed) {
        self.completed(flag);
    }
}

@end

