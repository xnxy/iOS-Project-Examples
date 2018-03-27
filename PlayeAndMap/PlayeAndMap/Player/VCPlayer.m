//
//  VCPlayer.m
//  PlayeAndMap
//
//  Created by dev on 2018/3/26.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VCPlayer.h"

@interface VCPlayer ()<ZFPlayerDelegate>

@property (nonatomic, strong) UIView *playerFatherView;
@property (nonatomic, strong) ZFPlayerView *playerView;

@property (nonatomic, assign) BOOL isPlaying; //离开界面时候是否在播放；
@property (nonatomic, strong) ZFPlayerModel *playerModel;

@end

@implementation VCPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self wr_setNavBarBackgroundAlpha:0.f];
    [self wr_setNavBarTintColor:[UIColor clearColor]];
    [self wr_setNavBarTitleColor:[UIColor clearColor]];
    
    self.playerFatherView = [UIView new];
    self.playerFatherView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.playerFatherView];
    
    //layout
    [self.playerFatherView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.top).offset(kStatusBarHeight);
        make.height.equalTo(self.playerFatherView.width).multipliedBy(9.0f/16.0f);
    }];
    
    
    self.playerView = [ZFPlayerView new];
    [self.playerView playerControlView:nil playerModel:self.playerModel];
    self.playerView.delegate = self;
    self.playerView.hasPreviewView = YES;
    
    [self.playerView autoPlayTheVideo];//设置自动播放 默认不自动播放
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // pop回来时候是否自动播放
    if (self.playerView && self.isPlaying) {
        self.isPlaying = NO;
        self.playerView.playerPushedOrPresented = NO;
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    // push出下一级页面时候暂停
    if (self.playerView && !self.playerView.isPauseByUser)
    {
        self.isPlaying = YES;
        self.playerView.playerPushedOrPresented = YES;
    }
}

#pragma mark ---
#pragma mark --- ZFPlayerDelegate ---

- (void)zf_playerBackAction {
    [self.navigationController popViewControllerAnimated:YES];
}


//- (BOOL)prefersStatusBarHidden {
//    return ZFPlayerShared.isStatusBarHidden;
//}

- (ZFPlayerModel *)playerModel{
    if (!_playerModel) {
        _playerModel = [[ZFPlayerModel alloc] init];
        _playerModel.videoURL = [NSURL URLWithString:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        _playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView1"];
        _playerModel.fatherView = self.playerFatherView;
    }
    return _playerModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
