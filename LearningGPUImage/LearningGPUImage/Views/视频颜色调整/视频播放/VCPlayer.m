//
//  VCPlayer.m
//  LearningGPUImage
//
//  Created by dev on 2018/1/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VCPlayer.h"
#import "ZFPlayer.h"

@interface VCPlayer ()<ZFPlayerDelegate>

@property (nonatomic, strong) ZFPlayerView *playerView;

@end

@implementation VCPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPlayer];
}

- (void)setupPlayer{
    
    self.playerView = [[ZFPlayerView alloc] init];
    
    [self.view addSubview:self.playerView];
    
    //初始化控制层view
    ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
    //初始化播放模型
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
    playerModel.videoURL = self.videoURL;
    playerModel.title = @"播放视频";
    playerModel.fatherView = self.view;
    [self.playerView playerControlView:controlView playerModel:playerModel];
    
    //设置代理
    self.playerView.delegate = self;
    //自动播放
    [self.playerView autoPlayTheVideo];
    
    //layout
    [self.playerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(100);
    }];
    
}

/** 返回按钮事件 */
- (void)zf_playerBackAction{
    
}

/** 下载视频 */
- (void)zf_playerDownload:(NSString *)url{
    
}

/** 控制层即将显示 */
- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen{
    
}

/** 控制层即将隐藏 */
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen{
    
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
