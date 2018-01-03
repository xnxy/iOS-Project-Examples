//
//  SliderView.h
//  LearningGPUImage
//
//  Created by dev on 2017/12/28.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderView : UIView

@property (nonatomic, assign) CGFloat changeValue;

- (instancetype)initWithFrame:(CGRect)frame name:(NSString *)name minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue defaultValue:(CGFloat)defaultValue;

@end
