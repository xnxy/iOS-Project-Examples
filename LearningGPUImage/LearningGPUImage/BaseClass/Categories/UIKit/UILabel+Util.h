//
//  UILabel+Util.h
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Util)

/**
 设置行间距
 
 @param text        内容
 @param lineSpacing 行间距离
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;


/**
 对字体添加阴影
 
 @param color 阴影颜色
 @param size  阴影的偏移量
 */
- (void)setShadowColor:(UIColor *)color shadowOffset:(CGSize)size;

@end
