//
//  NSString+File.m
//  BeaconTower
//
//  Created by dev on 2017/6/7.
//  Copyright © 2017年 周伟. All rights reserved.
//

#import "NSString+File.h"

@implementation NSString (File)

/**
 *  生成子文件夹
 *
 *  如果子文件夹不存在，则直接创建；如果已经存在，则直接返回
 *
 *  @param subFolder 子文件夹名
 *
 *  @return 文件夹路径
 */
- (NSString *)createSubFolder:(NSString *)subFolder{
    
    NSString *subFolderPath=[NSString stringWithFormat:@"%@/%@",self,subFolder];
    
    BOOL isDir = NO;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL existed = [fileManager fileExistsAtPath:subFolderPath isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:subFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return subFolderPath;
}

#pragma mark -
#pragma mark --- 计算单个文件的大小 ---
+ (long long)fileSizeAtPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

#pragma mark -
#pragma mark --- 遍历后获取文件夹的大小 ---
+ (float)folderSizeAtPath:(NSString*) folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:folderPath]) {
        return 0;
    }
    NSEnumerator *childFileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    long long folderSize = 0;
    while ((fileName=[childFileEnumerator nextObject]) != nil) {
        NSString *fileAbsolutedPath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutedPath];
    }
    return folderSize/(1024*1024);
}


@end
