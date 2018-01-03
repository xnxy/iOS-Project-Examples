//
//  ImageFilter.h
//  LearningGPUImage
//
//  Created by dev on 2017/12/29.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFilter : NSObject

// Brightness ranges from -1.0 to 1.0, with 0.0 as the normal level
+ (UIImage *)imageBrightnessFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange;
// 曝光
//Exposure ranges from -10.0 to 10.0, with 0.0 as the normal level
+ (UIImage *)imageExposureFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange;
// 对比度
//Contrast ranges from 0.0 to 4.0 (max contrast), with 1.0 as the normal level
+ (UIImage *)imageContrastFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange;
// 饱和度
/** Saturation ranges from 0.0 (fully desaturated) to 2.0 (max saturation), with 1.0 as the normal level
*/
+ (UIImage *)imageSaturationFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange;
// 伽马线
// Gamma ranges from 0.0 to 3.0, with 1.0 as the normal level
+ (UIImage *)imageGammaFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange;

@end
