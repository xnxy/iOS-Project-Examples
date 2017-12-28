//
//  NSString+File.h
//  BeaconTower
//
//  Created by dev on 2017/6/7.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (File)

/**
 *  生成子文件夹
 *
 *  如果子文件夹不存在，则直接创建；如果已经存在，则直接返回
 *
 *  @param subFolder 子文件夹名
 *
 *  @return 文件夹路径
 */
-(NSString *)createSubFolder:(NSString *)subFolder;

/**
 *  单个文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 大小
 */
+ (long long)fileSizeAtPath:(NSString *)filePath;

/**
 *  遍历文件夹获得文件夹大小
 *
 *  @param folderPath 文件夹路径
 *
 *  @return 返回多少M
 */
+ (float)folderSizeAtPath:(NSString*) folderPath;

@end
