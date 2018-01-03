//
//  SavePhotoAlbum.m
//  SaveImage
//
//  Created by dev on 2018/1/3.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "SavePhotoAlbum.h"
//#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@implementation SavePhotoAlbum

#pragma mark ---
#pragma mark --- 保存图片 ---
+ (void)savePhotoWithImage:(UIImage *)image{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

// 成功保存图片到相册中, 必须调用此方法, 否则会报参数越界错误
+ (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"----保存图片失败：%@-----",error.localizedDescription);
    }else{
        NSLog(@"---- 保存图片成功：%@------",contextInfo);
    }
}

#pragma mark ---
#pragma mark ---
+ (void)savePhotoWithImage:(UIImage *)image albumName:(NSString *)albumName completion:(void(^)(NSError *error))completion{
    if (@available(iOS 9.0,*))  { //9.0 之后
        /*
         PHAsset : 一个PHAsset 对象就代表一个资源文件
         PHAssetCollection: 一个PHAssetCollection对象就代表一个相册
         */
        __block NSString *assetId = nil; //__block 修改block外部的变量的值
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            
            assetId = [PHAssetCreationRequest creationRequestForAssetFromImage:image].placeholderForCreatedAsset.localIdentifier;
            
        } completionHandler:^(BOOL success, NSError * _Nullable error){
            
            if (error) {
                NSLog(@"--- 保存图片到相机胶卷失败 ---");
                if (completion) {
                    completion(error);
                }
                return ;
            }
            //获取相册对象
            PHAssetCollection *assetCollection = [self collectionWithAlbumName:albumName];
            //将“相机胶卷”中的图片添加到新的相册
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
                //根据唯一标识获取相片对象
                PHAsset *asset = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetId] options:nil].firstObject;
                //添加图片到相册中
                [request addAssets:@[asset]];
                
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                
                if (error) {
                    NSLog(@"--- 添加图片到相册中失败 ---");
                    if (completion) {
                        completion(error);
                    }
                    return ;
                }
                
                if (success && completion) {
                    completion(nil);
                }
                
                NSLog(@"---- 成功将图片添加到相册 ---");
                
            }];
            
        }];
        
    }else{
        
    }
}

/*
 * 返回相册
 */
+ (PHAssetCollection *)collectionWithAlbumName:(NSString *)albumName{
    //先获得之前创建过的相册
    PHFetchResult<PHAssetCollection *> *collectionResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
                                                                                                    subtype:PHAssetCollectionSubtypeAlbumRegular
                                                                                                    options:nil];
    for (PHAssetCollection *collection in collectionResult) {
        if ([collection.localizedTitle isEqualToString:albumName]) {
            return collection;
        }
    }
    
    //如果相册不存在，就创建个新的相册
    __block NSString *localIdentifier = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        localIdentifier = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumName].placeholderForCreatedAssetCollection.localIdentifier;
    } error:nil];
    
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[localIdentifier] options:nil].firstObject;
    
}


@end
