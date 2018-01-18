//
//  UIView+SetRect.h
//  ZVCycleScrollView
//
//  Created by dev on 2018/1/12.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SetRect)

#define kSCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)

#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size))
#define kStatusBarHeight (KISIphoneX?(44.f):(20.f))
#define kNavigationBarHeight 44.f
#define kTabBarHeight (kStatusBarHeight == 20.f?(49.f):(34.f + 49.f))
#define KHomeIndicatorHeight (KISIphoneX?(34.f):(0.f))
#define kNavigationAndStatusBarHeight (kStatusBarHeight + 44.f)

/*----------------------
 * Absolute coordinate *
 ----------------------*/

@property (nonatomic) CGPoint viewOrigin;
@property (nonatomic) CGSize  viewSize;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

/*----------------------
 * Relative coordinate *
 ----------------------*/

@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;
@property (nonatomic, readonly) CGPoint middlePoint;


@end
