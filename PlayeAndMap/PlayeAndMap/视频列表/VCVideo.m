//
//  VCVideo.m
//  PlayeAndMap
//
//  Created by dev on 2018/4/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VCVideo.h"
#import "VideoCollectionViewFlowLayout.h"
#import "VideoCollectionViewCell.h"

@interface VCVideo ()<UICollectionViewDelegate,UICollectionViewDataSource,ZFPlayerDelegate>

@property (nonatomic, strong) UICollectionView      *collectionView;

@property (nonatomic, strong) NSMutableArray        *dataSourceAry;

@property (nonatomic, strong) ZFPlayerView          *playerView;
@property (nonatomic, strong) ZFPlayerControlView   *controlView;

@end

@implementation VCVideo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self wr_setNavBarBackgroundAlpha:0.f];
    [self wr_setNavBarShadowImageHidden:YES];
    
    VideoCollectionViewFlowLayout *layout = [[VideoCollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    self.collectionView = collectionView;
    
    [self.view addSubview:collectionView];
    
    //layout
    [collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    [collectionView registerClass:NSClassFromString(@"VideoCollectionViewCell") forCellWithReuseIdentifier:identifier];
    
    KAdjustsScrollViewInsets_NO(self.collectionView, self)
    
}

#pragma mark ---
#pragma mark --- 页面消失的时候 ---
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.playerView resetPlayer];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSourceAry.count;
}

static NSString *identifier = @"identifier";
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // 取到对应cell的model
    __block NSURL *videoURL = [NSURL URLWithString:[self.dataSourceAry objectAtIndexSafe:indexPath.row]];
    __block NSIndexPath *weakIndexPath = indexPath;
    __block VideoCollectionViewCell *weakCell = cell;
    // 点击播放的回调
    @weakify(self)
    cell.playBlock = ^(UIButton *btn){
        @strongify(self)
        ZFPlayerModel *playerModel = [ZFPlayerModel new];
        playerModel.videoURL = videoURL;
        playerModel.scrollView = self.collectionView;
        playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView1"];
        playerModel.indexPath = weakIndexPath;
        playerModel.fatherViewTag = weakCell.paceImageView.tag;
        
        if(self.playerView){
            [self.playerView playerControlView:nil playerModel:playerModel];
            [self.playerView autoPlayTheVideo];
        }
        
    };

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0){
    NSLog(@"-----开始显示cell:%@-------indexPath:%@------",cell,indexPath);
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"------结束显示cell:%@-----indexPath:%@-----",cell,indexPath);
}

- (ZFPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        //当cell播放视频由全屏变为小屏时候，不回到中间
        _playerView.cellPlayerOnCenter = NO;
        //当cell划出屏幕时停止播放
        _playerView.stopPlayWhileCellNotVisable = YES;
        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
         _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        // 静音
        // _playerView.mute = YES;
    }
    return _playerView;
}

- (NSMutableArray *)dataSourceAry{
    if (!_dataSourceAry) {
        _dataSourceAry = [NSMutableArray array];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/1.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
        [_dataSourceAry addObject:@"https://oubus-oyyx.oss-cn-hangzhou.aliyuncs.com/uploads/video/2018-03-26/2.mp4"];
    }
    return _dataSourceAry;
}

//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}

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
