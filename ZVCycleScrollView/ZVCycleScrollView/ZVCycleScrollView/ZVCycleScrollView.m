//
//  ZVCycleScrollView.m
//  ZVCycleScrollView
//
//  Created by dev on 2018/1/12.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ZVCycleScrollView.h"
#import "ZVCollectionViewCell.h"
#import "UIView+SetRect.h"

NSString * const ID = @"ZVCycleScrollViewCell";

@interface ZVCycleScrollView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *mainView; //
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *imagePathsGroup;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger totalItemsCount;

@property (nonatomic, strong) UIImageView *backgroundImageView; //当imageURLs为空时的背景图

@end

@implementation ZVCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initialization];
        [self setupCollectionView];
        
    }
    return self;
}

#pragma mark ---
#pragma mark --- 初始化设置 ---
- (void)initialization{
    
    //自动滚动间隔
    self.autoScrollTimeInterval = 3.f;
    //是否无限循环
    self.infiniteLoop = YES;
    //是否自动滚动
    self.autoScroll = YES;
    //图片滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.backgroundColor = [UIColor lightGrayColor];
    
}

#pragma mark ---
#pragma mark --- 初始化UI ---
- (void)setupCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    
    [mainView registerClass:[ZVCollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    
    [self addSubview:mainView];
    
    self.mainView = mainView;
    
}

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageURLStringGroup:(NSArray *)imageURLStringGroup{
    ZVCycleScrollView *cycleScrollView = [[ZVCycleScrollView alloc]initWithFrame:frame];
    cycleScrollView.imageURLStringsGroup = [NSMutableArray arrayWithArray:imageURLStringGroup];
    return cycleScrollView;
}

#pragma mark ---
#pragma mark --- dataSource ---
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.totalItemsCount;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZVCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    return cell;
    
}



@end
