//
//  UILabel+Util.m
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "UILabel+Util.h"

@implementation UILabel (Util)

#pragma mark -
#pragma mark --- 设置行间距 ---
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

#pragma mark -
#pragma mark --- 对字体添加阴影 ---
- (void)setShadowColor:(UIColor *)color shadowOffset:(CGSize)size{
    self.shadowColor  = color;
    self.shadowOffset = size;
}

@end
