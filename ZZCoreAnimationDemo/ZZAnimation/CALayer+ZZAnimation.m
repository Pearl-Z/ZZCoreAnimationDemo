//
//  CALayer+ZZAnimation.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/8/2.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "CALayer+ZZAnimation.h"
#import "ZZAnimation.h"
#import <UIKit/UIKit.h>

#define ZZDefultTimimgFunction [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]

struct ZZCoordinates ZZCoordinatesMake(CGFloat x,CGFloat y,CGFloat z){
    struct ZZCoordinates axis = {x,y,z};
    return axis;
}


@implementation CALayer (ZZAnimation)


#pragma mark - ZZTransition
- (CATransition *)zz_animationTransType:(ZZTransAnimationType)type duration:(NSTimeInterval)duration subType:(ZZTransAnimationSubType)subType completedBlock:(void (^)(BOOL flag))completed{
    
    ZZTransition *animation = [self zz_setupTransitionWithType:type duration:duration subType:subType timeFunction:ZZDefultTimimgFunction];
    
    if (completed) {
        animation.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    [self addAnimation:animation forKey:@"ZZTransition"];
    return animation;
}

- (CATransition *)zz_animationTransType:(ZZTransAnimationType)type duration:(NSTimeInterval)duration subType:(ZZTransAnimationSubType)subType timeFunction:(CAMediaTimingFunction *)timeFunc completedBlock:(void (^)(BOOL flag))completed{
    ZZTransition *animation = [self zz_setupTransitionWithType:type duration:duration subType:subType timeFunction:timeFunc];
    if (completed) {
        animation.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    [self addAnimation:animation forKey:@"ZZTransition"];
    return animation;
}

- (ZZTransition *)zz_setupTransitionWithType:(ZZTransAnimationType)type duration:(NSTimeInterval)duration subType:(ZZTransAnimationSubType)subType timeFunction:(CAMediaTimingFunction *)timeFunc{
    ZZTransition *animation = [ZZTransition animation];
    animation.duration = duration;
    animation.timingFunction = timeFunc;
    switch (type) {
        case ZZTransAnimationCube:
            animation.type = @"cube";
            break;
        case ZZTransAnimationSuckEffect:
            animation.type = @"suckEffect";
            break;
        case ZZTransAnimationOglFlip:
            animation.type = @"oglFlip";
            break;
        case ZZTransAnimationRippleEffect:
            animation.type = @"rippleEffect";
            break;
        case ZZTransAnimationPageCurl:
            animation.type = @"pageCurl";
            break;
        case ZZTransAnimationPageUnCurl:
            animation.type = @"pageUnCurl";
            break;
        case ZZTransAnimationCameraIrisHollowOpen:
            animation.type = @"cameraIrisHollowOpen";
            break;
        case ZZTransAnimationCameraIrisHollowClose:
            animation.type = @"cameraIrisHollowClose";
            break;
        case ZZTransAnimationFade:
            animation.type = kCATransitionFade;
            break;
        case ZZTransAnimationMoveIn:
            animation.type = kCATransitionMoveIn;
            break;
        case ZZTransAnimationPush:
            animation.type = kCATransitionPush;
            break;
        case ZZTransAnimationReveal:
            animation.type = kCATransitionReveal;
            break;
            
        default:
            break;
    }
    
    switch (subType) {
        case ZZTransAnimationFromRight:
            animation.subtype = kCATransitionFromRight;
            break;
        case ZZTransAnimationFromLeft:
            animation.subtype = kCATransitionFromLeft;
            break;
        case ZZTransAnimationFromTop:
            animation.subtype = kCATransitionFromTop;
            break;
        case ZZTransAnimationFromBottom:
            animation.subtype = kCATransitionFromBottom;
            break;
            
        default:
            break;
    }
    return animation;
}

#pragma mark - ZZBasicAnimation
- (CABasicAnimation *)zz_basicAnimationWithType:(ZZBasicAnimationType)type duration:(float)duration coordinates:(struct ZZCoordinates)coordinates angle:(float)angle completedBlock:(void (^)(BOOL))completed{
    ZZBasicAnimation *animation = [ZZBasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:self.transform];
    switch (type) {
        case ZZBasicAnimationTypeTranslation:
            self.transform = CATransform3DTranslate(self.transform, coordinates.x, coordinates.y, coordinates.z);
            break;
            
        case ZZBasicAnimationTypeRotation:
             self.transform = CATransform3DRotate(self.transform, ZZ_AngleToRadian(angle), coordinates.x, coordinates.y, coordinates.z);
            break;
            
        case ZZBasicAnimationTypeScale:
            self.transform = CATransform3DScale(self.transform, coordinates.x, coordinates.y, coordinates.z);
            break;

        default:
            break;
    }
    
    animation.timingFunction = ZZDefultTimimgFunction;
    animation.toValue = [NSValue valueWithCATransform3D:self.transform];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    if (completed) {
        animation.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    [self addAnimation:animation forKey:@"ZZBasicAnimation"];
    return animation;
}


#pragma mark - ZZSpringAnimation
- (CASpringAnimation *)zz_springAnimationWithMass:(CGFloat)mass stiffness:(CGFloat)stiffness damping:(CGFloat)damping initialVelocity:(CGFloat)initialVelocity basicAnimationType:(ZZBasicAnimationType)type coordinates:(struct ZZCoordinates)coordinates angle:(float)angle completedBlock:(void (^)(BOOL flag))completed{
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0){
        return nil;
    }
    
    ZZSpringAnimation *animation = [ZZSpringAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:self.transform];
    switch (type) {
        case ZZBasicAnimationTypeTranslation:
            self.transform = CATransform3DTranslate(self.transform, coordinates.x, coordinates.y, coordinates.z);
            break;
            
        case ZZBasicAnimationTypeRotation:
            self.transform = CATransform3DRotate(self.transform, ZZ_AngleToRadian(angle), coordinates.x, coordinates.y, coordinates.z);
            break;
            
        case ZZBasicAnimationTypeScale:
            self.transform = CATransform3DScale(self.transform, coordinates.x, coordinates.y, coordinates.z);
            break;
            
        default:
            break;
    }
    
    animation.timingFunction = ZZDefultTimimgFunction;
    animation.toValue = [NSValue valueWithCATransform3D:self.transform];
    animation.duration = animation.settlingDuration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.damping = damping;
    animation.mass = mass;
    animation.stiffness = stiffness;
    animation.initialVelocity = initialVelocity;
    if (completed) {
        animation.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    [self addAnimation:animation forKey:@"ZZSpringAnimation"];
    return animation;
}


#pragma mark - ZZAnimationGroup
- (CAAnimationGroup *)zz_animationGroupWithAnimations:(NSArray *)animations duration:(float)duration completedBlock:(void (^)(BOOL))completed{
    ZZAnimationGroup *group = [[ZZAnimationGroup alloc] init];
    group.animations = animations;
    group.duration = duration;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeBoth;
    group.timingFunction = ZZDefultTimimgFunction;
    if (completed) {
        group.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    [self addAnimation:group forKey:@"ZZAnimationGroup"];
    return group;
}

#pragma mark - ZZKeyframeAnimation
- (CAKeyframeAnimation *)zz_keyframeAnimationWithPath:(UIBezierPath *)path duration:(NSTimeInterval)duration completedBlock:(void (^)(BOOL flag))completed{
    ZZKeyframeAnimation *moveAnimation = [ZZKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    moveAnimation.timingFunction = ZZDefultTimimgFunction;
    moveAnimation.duration = duration;
    moveAnimation.rotationMode = kCAAnimationRotateAuto; // 方向跟随路径旋转
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeBoth;
    moveAnimation.calculationMode = kCAAnimationPaced; // 均匀进行
    [self addAnimation:moveAnimation forKey:@"ZZKeyframeAnimationPath"];
    
    if (completed) {
        moveAnimation.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    return moveAnimation;
}

- (CAKeyframeAnimation *)zz_keyframeAnimationWithValues:(NSArray *)values duration:(NSTimeInterval)duration completedBlock:(void (^)(BOOL flag))completed{
    ZZKeyframeAnimation *moveAnimation = [ZZKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.values = values;
    moveAnimation.timingFunction = ZZDefultTimimgFunction;
    moveAnimation.duration = duration;
    moveAnimation.rotationMode = kCAAnimationRotateAuto; // 方向跟随路径旋转
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeBoth;
    moveAnimation.calculationMode = kCAAnimationPaced; // 均匀进行
    [self addAnimation:moveAnimation forKey:@"ZZKeyframeAnimationValues"];
    
    if (completed) {
        moveAnimation.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    return moveAnimation;
}

- (CAShapeLayer *)zz_drawPathAnimationWithPath:(UIBezierPath *)path lineWidth:(CGFloat)lineWidth lineColor:(CGColorRef)lineColor duration:(NSTimeInterval)duration completedBlock:(void (^)(BOOL flag))completed{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.strokeColor = lineColor;
    shapeLayer.lineWidth = lineWidth;
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    
    ZZBasicAnimation *ani = [ZZBasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.fromValue = @0;
    ani.toValue = @1;
    ani.duration = duration;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [shapeLayer addAnimation:ani forKey:@"strokeEnd"];
    [self addSublayer:shapeLayer];
    
    if (completed) {
        ani.completed = ^(BOOL flag){
            completed(flag);
        };
    }
    return shapeLayer;
}


@end






