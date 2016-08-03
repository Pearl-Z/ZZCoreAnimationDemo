//
//  CALayer+ZZAnimation.h
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/8/2.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class UIBezierPath;

/** 角度转弧度*/
#define ZZ_AngleToRadian(angle) (angle / 180.0 * M_PI)
/** 弧度转角度*/
#define ZZ_RadianToAngle(radians) (radians / M_PI * 180.0)


typedef enum {
    /** 立方体 */
    ZZTransAnimationCube,
    /** 吸收 */
    ZZTransAnimationSuckEffect,
    /** 翻转 */
    ZZTransAnimationOglFlip,
    /** 波纹 */
    ZZTransAnimationRippleEffect,
    /** 翻页 */
    ZZTransAnimationPageCurl,
    /** 反翻页 */
    ZZTransAnimationPageUnCurl,
    /** 镜头开 */
    ZZTransAnimationCameraIrisHollowOpen,
    /** 镜头关 */
    ZZTransAnimationCameraIrisHollowClose,
    /** 淡化 */
    ZZTransAnimationFade,
    /** 推挤 */
    ZZTransAnimationMoveIn,
    /** 揭开 */
    ZZTransAnimationPush,
    /** 覆盖 */
    ZZTransAnimationReveal
    
}ZZTransAnimationType;

typedef enum {
    /** 从右边执行 */
    ZZTransAnimationFromRight,
    /** 从左边执行 */
    ZZTransAnimationFromLeft,
    /** 从上边执行 */
    ZZTransAnimationFromTop,
    /** 从下边执行 */
    ZZTransAnimationFromBottom,
}ZZTransAnimationSubType;

typedef enum {
    /** 旋转*/
    ZZBasicAnimationTypeRotation,
    /** 缩放*/
    ZZBasicAnimationTypeScale,
    /** 平移*/
    ZZBasicAnimationTypeTranslation
}ZZBasicAnimationType;

/** x,y,z垂直坐标系*/
struct ZZCoordinates{
    CGFloat x,y,z;
};
extern struct ZZCoordinates ZZCoordinatesMake(CGFloat x,CGFloat y,CGFloat z);


@interface CALayer (ZZ_CATransition)

/**
 *  快速添加转场动画(默认timefunction：EaseInEaseOut)
 *  转场动画的封装
 *
 *  @param type     转场动画类型
 *  @param duration 动画执行时间
 *  @param subType  动画执行方向
 */
- (CATransition *)zz_animationTransType:(ZZTransAnimationType)type duration:(NSTimeInterval)duration subType:(ZZTransAnimationSubType)subType completedBlock:(void (^)(BOOL flag))completed;


/**
 *  快速添加转场动画(默认timefunction：EaseInEaseOut)
 *  需要自定义timeFunction的转场动画封装
 *
 *  @param type     转场动画类型
 *  @param layer    需要加载动画的layer
 *  @param duration 动画执行时间
 *  @param subType  动画执行方向
 */
- (CATransition *)zz_animationTransType:(ZZTransAnimationType)type duration:(NSTimeInterval)duration subType:(ZZTransAnimationSubType)subType timeFunction:(CAMediaTimingFunction *)timeFunc completedBlock:(void (^)(BOOL flag))completed;


/*!
 *  @brief 基本动画快速封装（旋转、平移、缩放）
 *
 *  @param duration  动画执行时间
 *  @param axis      坐标系变化的值 使用 ZZAxisMake(CGFloat x,CGFloat y,CGFloat z) 创建
 *  @param angle     角度，如 90° 传 90.0 即可 (只有旋转才用得到)
 *  @param completed 完成回调
 */
- (CABasicAnimation *)zz_basicAnimationWithType:(ZZBasicAnimationType)type duration:(float)duration coordinates:(struct ZZCoordinates)coordinates angle:(float)angle completedBlock:(void (^)(BOOL flag))completed;


/*!
 *  @brief 动画组
 *
 *  @param animations 动画数组
 *  @param duration   动画时间
 *  @param completed  完成回调
 *
 *  @return CAAnimationGroup
 */
- (CAAnimationGroup *)zz_animationGroupWithAnimations:(NSArray *)animations duration:(float)duration completedBlock:(void (^)(BOOL flag))completed;

/*!
 *  @brief 弹性动画的快速封装
 *
 *  @param mass            质量
 *  @param stiffness       刚度系数
 *  @param damping         阻尼系数
 *  @param initialVelocity 初始速度
 *  @param type            动画类型（旋转、平移、缩放）
 *  @param coordinates     坐标系变化的值 使用 ZZAxisMake(CGFloat x,CGFloat y,CGFloat z) 创建
 *  @param angle           角度，如 90° 传 90.0 即可 (只有旋转才用得到)
 *  @param completed       完成回调
 *
 *  @return CASpringAnimation
 */
- (CASpringAnimation *)zz_springAnimationWithMass:(CGFloat)mass stiffness:(CGFloat)stiffness damping:(CGFloat)damping initialVelocity:(CGFloat)initialVelocity basicAnimationType:(ZZBasicAnimationType)type coordinates:(struct ZZCoordinates)coordinates angle:(float)angle completedBlock:(void (^)(BOOL flag))completed;




- (CAKeyframeAnimation *)zz_keyframeAnimationWithPath:(UIBezierPath *)path duration:(NSTimeInterval)duration completedBlock:(void (^)(BOOL flag))completed;

- (CAKeyframeAnimation *)zz_keyframeAnimationWithValues:(NSArray *)values duration:(NSTimeInterval)duration completedBlock:(void (^)(BOOL flag))completed;


- (CAShapeLayer *)zz_drawPathAnimationWithPath:(UIBezierPath *)path lineWidth:(CGFloat)lineWidth lineColor:(CGColorRef)lineColor duration:(NSTimeInterval)duration completedBlock:(void (^)(BOOL flag))completed;


@end




