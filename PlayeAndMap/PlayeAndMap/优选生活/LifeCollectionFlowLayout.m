//
//  LifeCollectionFlowLayout.m
//  PlayeAndMap
//
//  Created by dev on 2018/4/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "LifeCollectionFlowLayout.h"

@implementation LifeCollectionFlowLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        //头部视图
        self.headerReferenceSize = CGSizeMake(screenWidth, 10);
        //cell大小
        CGFloat itemWidth = (screenWidth - 30)/2;
        self.itemSize = CGSizeMake(itemWidth, itemWidth);
        //每行最小间距
        self.minimumLineSpacing = 10.f;
        //每列最小间距
        self.minimumInteritemSpacing = 10.f;
        //CollectionView视图 上下左右边距
        self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
    }
    return self;
}

@end
