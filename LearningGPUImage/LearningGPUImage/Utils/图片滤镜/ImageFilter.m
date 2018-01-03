//
//  ImageFilter.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/29.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ImageFilter.h"

@implementation ImageFilter

#pragma mark ---
#pragma mark --- 亮度 ---
// Brightness ranges from -1.0 to 1.0, with 0.0 as the normal level
+ (UIImage *)imageBrightnessFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange{
    if (!image) {
        return nil;
    }
    //设置滤镜
    GPUImageBrightnessFilter *filter = [[GPUImageBrightnessFilter alloc] init];
    filter.brightness = value;
    
    return addFilter(filter, image, imageChange);
}

#pragma mark ---
#pragma mark --- 曝光 ---
//Exposure ranges from -10.0 to 10.0, with 0.0 as the normal level
+ (UIImage *)imageExposureFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange{
    if (!image) {
        return nil;
    }
    //设置滤镜
    GPUImageExposureFilter *filter = [[GPUImageExposureFilter alloc] init];
    filter.exposure = value;
    
    return addFilter(filter, image, imageChange);
    
}

#pragma mark ---
#pragma mark --- 对比度 ---
//Contrast ranges from 0.0 to 4.0 (max contrast), with 1.0 as the normal level
+ (UIImage *)imageContrastFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange{
    if (!image) {
        return nil;
    }
    //设置滤镜
    GPUImageContrastFilter *filter = [[GPUImageContrastFilter alloc] init];
    filter.contrast = value;
    
    return addFilter(filter, image, imageChange);
    
}

#pragma mark ---
#pragma mark --- 饱和度 ---
/** Saturation ranges from 0.0 (fully desaturated) to 2.0 (max saturation), with 1.0 as the normal level
 */
+ (UIImage *)imageSaturationFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange{
    if (!image) {
        return nil;
    }
    //设置滤镜
    GPUImageSaturationFilter *filter = [[GPUImageSaturationFilter alloc] init];
    filter.saturation = value;
    
    return addFilter(filter, image, imageChange);
    
}

#pragma mark ---
#pragma mark --- GPUImageGammaFilter [伽马线] ---
// Gamma ranges from 0.0 to 3.0, with 1.0 as the normal level
+ (UIImage *)imageGammaFilter:(CGFloat)value image:(UIImage *)image imageChange:(BOOL)imageChange{
    if (!image) {
        return nil;
    }
    //设置滤镜
    GPUImageGammaFilter *filter = [[GPUImageGammaFilter alloc] init];
    filter.gamma = value;

    return addFilter(filter, image, imageChange);
}

#pragma mark ---
#pragma mark --- 添加滤镜 ---
static GPUImagePicture *imagePicture = nil;
UIImage* addFilter(GPUImageOutput<GPUImageInput>* filter, UIImage *image, BOOL imageChange){
    //获取数据源
    if (!imagePicture) {
        imagePicture = [[GPUImagePicture alloc] initWithImage:image];
    }
    if (imageChange) { //如果图片更换  更换数据源
        imagePicture = [[GPUImagePicture alloc] initWithImage:image];
    }
    //设置图片渲染区域
    if (!filter) {
        [imagePicture removeAllTargets];
        return nil;
    }
    
    [filter forceProcessingAtSize:image.size];
    [filter useNextFrameForImageCapture];
    
    //添加上滤镜
    [imagePicture removeAllTargets];
    [imagePicture addTarget:filter];
    //开始渲染
    [imagePicture processImage];
    //获取渲染后的图片
    UIImage *newImage = [filter imageFromCurrentFramebuffer];
    
    return newImage;
}

@end
