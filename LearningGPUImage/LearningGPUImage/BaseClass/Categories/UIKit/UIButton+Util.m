//
//  UIButton+Util.m
//  YouXuan
//
//  Created by dev on 2017/10/30.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "UIButton+Util.h"

@implementation UIButton (Util)

#pragma mark ---
#pragma mark --- 快速创建一个按钮 ---
+ (UIButton *)customButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize backGroundColor:(UIColor *)backColor cornerRadius:(CGFloat)cornerRadius{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    btn.backgroundColor = backColor;
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.masksToBounds = cornerRadius>0;
    
    return btn;
}

#pragma mark ---
#pragma mark ---
+ (UIButton *)customButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backGroundColor:(UIColor *)backColor cornerRadius:(CGFloat)cornerRadius{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backColor;
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.masksToBounds = cornerRadius>0;
    
    return btn;
}


#pragma mark ---
#pragma mark --- 快速创建 BarButtonItem ---
+ (UIButton *)customBarButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName{
    
    UIButton *btn        = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame            = CGRectMake(0, 0, 60, 30);
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleEdgeInsets  = UIEdgeInsetsMake(0, 10, 0, -10);
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    if (imageName) {
       [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    return btn;
}

@end
