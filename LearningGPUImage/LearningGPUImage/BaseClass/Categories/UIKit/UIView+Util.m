//
//  UIView+Util.m
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "UIView+Util.h"


@implementation UIView (Util)

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderWidth:(CGFloat)width andColor:(UIColor *)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)hudText:(NSString *)text{
    AppDelegate *delegate = [Utils getAppDelegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:delegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:3.f];
}



@end
