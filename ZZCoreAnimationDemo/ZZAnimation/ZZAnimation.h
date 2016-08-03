//
//  ZZAnimation.h
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

//  方便将完成状态以block形式传递出来

#import <QuartzCore/QuartzCore.h>

typedef void (^ZZAnimationCompleted)(BOOL flag);

@interface ZZAnimation : CAAnimation

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end


@interface ZZTransition : CATransition

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end


@interface ZZAnimationGroup : CAAnimationGroup

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end


@interface ZZPropertyAnimation : CAPropertyAnimation

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end


@interface ZZBasicAnimation : CABasicAnimation

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end

@interface ZZKeyframeAnimation : CAKeyframeAnimation

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end

@interface ZZSpringAnimation : CASpringAnimation

@property(nonatomic,copy) ZZAnimationCompleted completed;

@end

