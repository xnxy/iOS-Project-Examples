//
//  UIButton+Util.h
//  YouXuan
//
//  Created by dev on 2017/10/30.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Util)

//快速创建一个按钮
+ (UIButton *)customButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize backGroundColor:(UIColor *)backColor cornerRadius:(CGFloat)cornerRadius;
//字体---
+ (UIButton *)customButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backGroundColor:(UIColor *)backColor cornerRadius:(CGFloat)cornerRadius;

+ (UIButton *)customBarButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName;

@end
