//
//  VideoHandleColor.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/29.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VideoHandleColor.h"

@interface VideoHandleColor ()

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera; //摄像头
@property (nonatomic, strong) GPUImageView *fillterImageView;

@property (nonatomic, strong) GPUImageMovieWriter *movieWriter; //录制
@property (nonatomic, strong) NSMutableDictionary *audioSetDic; //声音设置

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation VideoHandleColor

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"去播放"
                                                                                 style:UIBarButtonItemStyleDone
                                                                               handler:^(id sender)
    {
        
    }];
    
    
    UIButton  *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    recordBtn.backgroundColor = [UIColor blueColor];
    [recordBtn setTitle:@"录制" forState:UIControlStateNormal];
    [recordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [recordBtn setCornerRadius:50];
    
    [self.view addSubview:recordBtn];
    
    //layout
    [recordBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.view.bottom).offset(50);
        make.width.height.equalTo(100);
    }];
    
    //action
    [[recordBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         
     }];
    
}

#pragma mark ---
#pragma mark --- 录制视频 ---
- (void)recordVideo{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie4.mov"];
    [CoreArchive removeRootObjectWithFile:path];
    
//    NSURL *videoUrl = [NSURL URLWithString:path];
//    //
//    NSMutableDictionary *videoSetDic = [NSMutableDictionary dictionary];
    
    
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
