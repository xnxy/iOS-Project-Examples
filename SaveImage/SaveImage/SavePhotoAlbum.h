//
//  SavePhotoAlbum.h
//  SaveImage
//
//  Created by dev on 2018/1/3.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SavePhotoAlbum : NSObject

//直接保存图片相册中(不需要自己创建新的相簿)
+ (void)savePhotoWithImage:(UIImage *)image;
//保存图片到自己创建的相册中
+ (void)savePhotoWithImage:(UIImage *)image albumName:(NSString *)albumName completion:(void(^)(NSError *error))completion;

@end
