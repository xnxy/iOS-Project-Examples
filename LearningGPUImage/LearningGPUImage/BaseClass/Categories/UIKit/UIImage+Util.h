//
//  UIImage+Util.h
//  BeaconTower
//
//  Created by dev on 2017/8/10.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)

//改变UIImage的颜色
//来源： http://www.hudongdong.com/ios/447.html
- (UIImage*)imageChangeColor:(UIColor*)color;

//圆形图片
- (UIImage *)roundImageWithSize:(CGSize)size borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

//生成条形码
+ (UIImage *) generateBarCodeImage:(NSString *)source withSize:(CGSize)size;

@end
