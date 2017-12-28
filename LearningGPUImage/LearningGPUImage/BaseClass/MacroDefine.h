//
//  MacroDefine.h
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h


#define FORMAT(string, args...) [NSString stringWithFormat:string, args]
#define URL(url) [NSURL URLWithString:url]

#ifdef DEBUG
#define DLog(...) printf("[%s %d行]:\n%s\n", __PRETTY_FUNCTION__, __LINE__,[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#define DLog_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#else
#define DLog(...) ;
#define DLog_CURRENT_METHOD ;
#endif

//
#define kSCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)

#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size))

//#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define kStatusBarHeight (KISIphoneX?(44.f):(20.f))

#define kNavigationBarHeight 44.f
#define kTabBarHeight (kStatusBarHeight == 20.f?(49.f):(34.f + 49.f))



#define KHomeIndicatorHeight (KISIphoneX?(34.f):(0.f))

#define kNavigationAndStatusBarHeight (kStatusBarHeight + 44.f)

//导航条颜色变化点
#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - kNavigationAndStatusBarHeight*2)
#define IMAGE_HEIGHT 220

#pragma mark - ios版本判断
#define kIOS8_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending)
#define kIOS9_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending)
#define kIOS10_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending)
#define kIOS11_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"11.0"] != NSOrderedAscending)
/*
 iPhone 6          w:375  h:667
 iPhone 6 Plus     w:414  h:736
 iPhone 6s         w:375  h:667
 iPhone 6s Plus    w:414  h:736
 iPhone 7          w:375  h:667
 iPhone 7 Plus     w:414  h:736
 iPhone 8          w:375  h:667
 iPhone 8 Plus     w:414  h:736
 iPhone SE         w:320  h:568
 iPhone X          w:375  h:812
 */

//设备信息
#define kIOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]
#define kDEVICE_MODEL   [[UIDevice currentDevice] model]
#define kIS_IPAD        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define kisRetina       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kAPP_NAME            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kAPP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPP_SUB_VERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kUDeviceIdentifier   [[UIDevice currentDevice] uniqueDeviceIdentifier]

//
#define kWidth(x)             round((x)/(750.f)  * ([UIScreen mainScreen].bounds.size.width))
#define kHeight(x)            round(KISIphoneX?((x) / (1334.f) *  667.f):((x) / (1334.f) * ([UIScreen mainScreen].bounds.size.height)))

// 分割线的粗细
#define SEP_LINE_SIZE 1.0f

//颜色
#define RGB_HEX(V)		[UIColor colorWithHex:V]
#define RGBA_HEX(V, A)	[UIColor colorWithHex:V alpha:A]


//适配iOS11 --->scrollView下移间距
#define  KAdjustsScrollViewInsets_NO(scrollView,vc)\
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
if (@available(iOS 11.0,*))  {\
scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
self.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \


#endif /* MacroDefine_h */
