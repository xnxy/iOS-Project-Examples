//
//  VideoCollectionViewFlowLayout.m
//  PlayeAndMap
//
//  Created by dev on 2018/4/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VideoCollectionViewFlowLayout.h"

@implementation VideoCollectionViewFlowLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        
        self.itemSize = CGSizeMake(screenWidth, screenHeight);
        self.minimumLineSpacing = 0.f;
        self.minimumInteritemSpacing = 0.f;
        
        //水平滚动
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    return self;
}

@end
