//
//  ZVCycleScrollView.h
//  ZVCycleScrollView
//
//  Created by dev on 2018/1/12.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZVCycleScrollView : UIView

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageURLStringGroup:(NSArray *)imageURLStringGroup;


//////////////////////  数据源API //////////////////////

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应要显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;


//////////////////////  滚动控制API //////////////////////

/** 自动滚动间隔时间,默认2s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/** 是否无限循环,默认Yes */
@property (nonatomic,assign) BOOL infiniteLoop;

/** 是否自动滚动,默认Yes */
@property (nonatomic,assign) BOOL autoScroll;

/** 图片滚动方向，默认为水平滚动 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

/** block方式监听点击 */
@property (nonatomic, copy) void (^clickItemOperationBlock)(NSInteger currentIndex);

/** block方式监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);
/** 解决viewWillAppear时出现时轮播图卡在一半的问题，在控制器viewWillAppear时调用此方法 */
//- (void)adjustWhenControllerViewWillAppera;

//////////////////////  自定义样式API  //////////////////////
/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;
/** 占位图，用于网络未加载到图片时 */

@end
