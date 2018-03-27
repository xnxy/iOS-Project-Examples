//
//  VCPlayerList.m
//  PlayeAndMap
//
//  Created by dev on 2018/3/26.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VCPlayerList.h"
#import "PlayerListCell.h"

@interface VCPlayerList ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataAry;

@property (nonatomic, strong) ZFPlayerView   *playerView;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation VCPlayerList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.playerView && !self.playerView.isPauseByUser)
    {
        self.playerView.playerPushedOrPresented = YES;
    }
}

- (void)setupTableView{
    
    UITableView *tableView = [UITableView customTableViewWithFrame:CGRectZero
                                                             style:UITableViewStylePlain
                                                    separatorColor:[UIColor clearColor]
                                      estimatedSectionHeaderHeight:0
                                      estimatedSectionFooterHeight:0];
    tableView.delegate      = self;
    tableView.dataSource    = self;
    self.tableView          = tableView;
    [self.view addSubview:tableView];
    
    //layout
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tableView registerClass:NSClassFromString(@"PlayerListCell") forCellReuseIdentifier:TableViewCellIdentifier1];
    
}

#pragma mark ---
#pragma mark --- dataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataAry.count;
}
static NSString* TableViewCellIdentifier1 = @"TableViewCellIdentifier1";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PlayerListCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier1];
    cell.indexPath = indexPath;

    @weakify(self);
    cell.playBlock = ^(UIButton *btn, UIImageView *packView,NSIndexPath *path) {
        @strongify(self);
        NSString *urlStr = [self.dataAry objectAtIndexSafe:path.row];
        
        ZFPlayerModel *playerModel = [ZFPlayerModel new];
        playerModel.videoURL = [NSURL URLWithString:urlStr];
        playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView1"];
        
        playerModel.scrollView = self.tableView;
        playerModel.indexPath = path;
        
        playerModel.fatherViewTag = packView.tag;
        
        if (packView) {
            [self.playerView playerControlView:nil playerModel:playerModel];
            [self.playerView autoPlayTheVideo];
        }
        
    };
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ZFPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [ZFPlayerView sharedPlayerView];
        // 当cell播放视频由全屏变为小屏时候，不回到中间位置
        _playerView.cellPlayerOnCenter = NO;
        //当cell划出屏幕的时候停止播放
        _playerView.stopPlayWhileCellNotVisable = YES;
        //当cell划出屏幕的时候停止播放
        _playerView.stopPlayWhileCellNotVisable = YES;
        _playerView.forcePortrait = NO;
        ZFPlayerShared.isLockScreen = YES;
        ZFPlayerShared.isStatusBarHidden = NO;
    }
    return _playerView;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [[ZFPlayerControlView alloc] init];
    }
    return _controlView;
}

- (NSMutableArray *)dataAry{
    if (!_dataAry) {
        _dataAry = [NSMutableArray array];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
    }
    return _dataAry;
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
