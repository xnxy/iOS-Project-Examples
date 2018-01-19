//
//  ViewController.m
//  SegmentView
//
//  Created by dev on 2018/1/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"

#import "VCFirst.h"
#import "VCSecond.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SegmentView   *segmentView;
@property (nonatomic, strong) UIScrollView  *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    //上方分段控制器
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectZero
                                                              ary:@[@"处理中",@"已确认"]];
    self.segmentView.selectedIndex = 1;
    self.segmentView = segmentView;
    
    //滑动列表
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    
    [self.view addSubview:segmentView];
    [self.view addSubview:self.scrollView];
    
    //layout
    [segmentView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(100);
    }];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(segmentView.bottom);
    }];
    
    //设置内容区域
    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH * 2, self.scrollView.mj_h);
    
    //处理中
    VCFirst *first = [VCFirst new];
    first.view.frame = CGRectMake(0, 0, kSCREEN_WIDTH, self.scrollView.mj_h);
    [self addChildViewController:first];
    [self.scrollView addSubview:first.view];
    
    //已确认
    VCSecond *second = [VCSecond new];
    second.view.frame = CGRectMake(kSCREEN_WIDTH, 0, kSCREEN_WIDTH, self.scrollView.mj_h);
    [self addChildViewController:second];
    [self.scrollView addSubview:second.view];
    
    //点击
    @weakify(self)
    segmentView.clickTouch = ^(UIButton *btn, NSInteger tag) {
        @strongify(self);
        [self.scrollView setContentOffset:CGPointMake(tag * kSCREEN_WIDTH, 0) animated:YES];
    };
}

#pragma mark ---
#pragma mark --- ScrollViewDelegate ---
//停止滑动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x /kSCREEN_WIDTH;
    [self.segmentView setSelectedIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
