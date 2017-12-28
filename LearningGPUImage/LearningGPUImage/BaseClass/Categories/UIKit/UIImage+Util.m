//
//  UIImage+Util.m
//  BeaconTower
//
//  Created by dev on 2017/8/10.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage (Util)

#pragma mark -
#pragma mark --- 改变UIImage的颜色 ---
-(UIImage*)imageChangeColor:(UIColor*)color
{
    //获取画布
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    //画笔沾取颜色
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    //绘制一次
    [self drawInRect:bounds blendMode:kCGBlendModeOverlay alpha:1.0f];
    //再绘制一次
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    //获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (UIImage *)roundImageWithSize:(CGSize)size borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    CGSize imageSize = size;
    
    if (borderWidth > 0) {
        imageSize = CGSizeMake(size.width + 2 * borderWidth, size.height + 2 * borderWidth);
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0f);
    
    if (borderWidth > 0) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
        [borderColor set];
        [path addClip];
        [path fill];
    }
    
    // 2.加入一个圆形路径到图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake((imageSize.width-size.width)/2, (imageSize.height-size.height)/2, size.width, size.height);
    
    CGContextAddEllipseInRect(ctx, rect);
    
    // 3.裁剪
    
    CGContextClip(ctx);
    
    // 4.绘制图像
    
    [self drawInRect:rect];
    
    // 4.取得图像
    
    UIImage* roundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    
    UIGraphicsEndImageContext();
    
    return roundImage;
}

/**
 *  生成条形码
 *
 *  @param source
 *
 *  @return 生成条形码的CIImage对象
 */
+ (UIImage *) generateBarCodeImage:(NSString *)source withSize:(CGSize)size
{
    // iOS 8.0以上的系统才支持条形码的生成，iOS8.0以下使用第三方控件生成
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 注意生成条形码的编码方式
        NSData *data = [source dataUsingEncoding: NSASCIIStringEncoding];
        CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
        [filter setValue:data forKey:@"inputMessage"];
        // 设置生成的条形码的上，下，左，右的margins的值
        [filter setValue:[NSNumber numberWithInteger:0] forKey:@"inputQuietSpace"];
        
        CGRect extent = CGRectIntegral(filter.outputImage.extent);
        CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
        CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
        size_t width = CGRectGetWidth(extent) * scaleWidth;
        size_t height = CGRectGetHeight(extent) * scaleHeight;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
        CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
        
        CGColorSpaceRelease(colorSpaceRef);
        
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:filter.outputImage fromRect:extent];
        CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
        CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
        CGContextDrawImage(contentRef, extent, imageRef);
        CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
        CGContextRelease(contentRef);
        CGImageRelease(imageRef);
        UIImage *image = [UIImage imageWithCGImage:imageRefResized];
        CGImageRelease(imageRefResized);
        return image;
    }else{
        return nil;
    }
}

@end
