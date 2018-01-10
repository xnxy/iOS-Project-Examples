//
//  VideoHandleColor.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/29.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VideoHandleColor.h"
#import "VCPlayer.h"

@interface VideoHandleColor ()

@property (nonatomic, strong) GPUImageVideoCamera *videoCamera; //摄像头

@property (nonatomic, strong) GPUImageView *imageView; //显示view
@property (nonatomic, strong) GPUImageFilterGroup *filterGroup; //滤镜组

@property (nonatomic, strong) GPUImageMovieWriter *movieWriter; //录制

@property (nonatomic, strong) UIButton *recordBtn;

@end

@implementation VideoHandleColor

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCamera]; //设置相机
    [self setupUI];
    
}

- (void)setupUI{
    
    @weakify(self);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"去播放"
                                                                                 style:UIBarButtonItemStyleDone
                                                                               handler:^(id sender)
    {
        @strongify(self)
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie4.mov"];
        NSLog(@"------%@------",path);
        VCPlayer *vc = [VCPlayer new];
        vc.videoURL = [NSURL fileURLWithPath:path];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    
    UIButton  *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    recordBtn.backgroundColor = [UIColor blueColor];
    [recordBtn setTitle:@"录制" forState:UIControlStateNormal];
    [recordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [recordBtn setCornerRadius:50];
    
    self.recordBtn = recordBtn;
    
    [self.view addSubview:recordBtn];
    
    //layout
    [recordBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.bottom).offset(-40);
        make.width.height.equalTo(100);
    }];
    
    //action
    
    [[recordBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self);
         [self timeAnimation];
     }];
    
}

#pragma mark ---
#pragma mark --- 定时器 --
- (void)timeAnimation{
    
    POPBasicAnimation *basicAnimation = [POPBasicAnimation linearAnimation];
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"timeAnimation"
                                                              initializer:^(POPMutableAnimatableProperty *prop)
    {
        
        prop.writeBlock = ^(id obj, const CGFloat *values) {
            UIButton *btn = (UIButton *)obj;
            [btn setTitle:[NSString stringWithFormat:@"%d",(int)values[0]%60] forState:UIControlStateNormal];
        };
        
    }];
    
    basicAnimation.property = prop;
    basicAnimation.fromValue = @(10);
    basicAnimation.toValue = @(1);
    basicAnimation.duration = 10;
    
    [self.recordBtn pop_addAnimation:basicAnimation forKey:@"timeAnimation"];
    
    //开始
    @weakify(self)
    basicAnimation.animationDidStartBlock = ^(POPAnimation *anim) {
        @strongify(self)
        self.recordBtn.enabled = NO;
        //开始录制
        [self.filterGroup addTarget:self.movieWriter];//录制视频 添加滤镜
        self.videoCamera.audioEncodingTarget = self.movieWriter;
        [self.movieWriter startRecording];
        
    };
    
    //结束
    basicAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        @strongify(self)
        self.recordBtn.enabled = YES;
        [self.recordBtn setTitle:@"重新录制" forState:UIControlStateNormal];
        [self.movieWriter finishRecording];
        [self.filterGroup removeTarget:self.movieWriter];
    };
}

#pragma mark ---
#pragma mark --- 初始化相机 ---
- (void)initCamera{
    
    //GPUImageView 显示View
    self.imageView = [[GPUImageView alloc]initWithFrame:self.view.frame];
    self.imageView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    [self.view addSubview:self.imageView];
    
    //相机
    self.videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720
                                                           cameraPosition:AVCaptureDevicePositionFront];
    //先设置前置摄像头
    self.videoCamera.horizontallyMirrorFrontFacingCamera = YES; //水平前置
    self.videoCamera.horizontallyMirrorRearFacingCamera  = NO; //水平后置
    self.videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait; //输出图像方向  竖屏

    //滤镜组
    [self.videoCamera addTarget:self.filterGroup]; //将滤镜效果添加给摄像头
    [self.filterGroup addTarget:self.imageView]; // 将摄像头的图形给GPUImage显示
    
    [self.videoCamera addAudioInputsAndOutputs];
    [self.videoCamera startCameraCapture];
    
}

#pragma mark ---
#pragma mark --- 视频录制 ---
- (GPUImageMovieWriter *)movieWriter{
    if (!_movieWriter) {
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie4.mov"];
        [CoreArchive removeRootObjectWithFile:path];
        NSURL *videoUrl = [NSURL fileURLWithPath:path];
        //视频设置
        NSMutableDictionary *videoSetDic = [NSMutableDictionary dictionary];
        [videoSetDic setObject:AVVideoCodecH264 forKey:AVVideoCodecKey]; //视频编码方式
        NSNumber *videoWidth = [NSNumber numberWithFloat:720]; //视频宽高 最后设置为videoCamera的宽高
        NSNumber *videoHeight = [NSNumber numberWithFloat:1280];
        [videoSetDic setObject:videoWidth forKey:AVVideoWidthKey]; //视频的宽度
        [videoSetDic setObject:videoHeight forKey:AVVideoHeightKey]; //视频的高
        
        //音频设置
        AudioChannelLayout channelLayout;
        memset(&channelLayout, 0, sizeof(AudioChannelLayout));
        channelLayout.mChannelLayoutTag = kAudioChannelLayoutTag_Stereo;
        //音频的一些设置  包括AAC、音频通道、采样率和音频的比特率
        NSMutableDictionary *audioDic = [NSMutableDictionary dictionary];
        [audioDic setObject:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey]; //AAC
        [audioDic setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey]; //音频通道
        [audioDic setObject:[NSNumber numberWithFloat:16000.0] forKey:AVSampleRateKey]; //采样率
        [audioDic setObject:[NSNumber numberWithInt:32000] forKey:AVEncoderBitRateKey]; //音频的比特率
        [audioDic setObject:[NSData dataWithBytes:&channelLayout length:sizeof(AudioChannelLayout)] forKey:AVChannelLayoutKey];
        
        _movieWriter = [[GPUImageMovieWriter alloc]initWithMovieURL:videoUrl
                                                               size:CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT)
                                                           fileType:AVFileTypeMPEG4
                                                     outputSettings:videoSetDic];
        [_movieWriter setHasAudioTrack:YES audioSettings:audioDic];
        //        _movieWriter.hasAudioTrack = YES; //是否有声音
        _movieWriter.encodingLiveVideo = YES; //编码视频直播
    
    }
    return _movieWriter;
}

#pragma mark ---
#pragma mark --- 添加滤镜 ---
- (GPUImageFilterGroup *)filterGroup{
    if (!_filterGroup) {
        _filterGroup = [[GPUImageFilterGroup alloc] init];
        //亮度 -1.0 ~ 1.0
        GPUImageBrightnessFilter *brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
        brightnessFilter.brightness = 0.0f;
        //曝光 -10.0 ~ 10.0
        GPUImageExposureFilter *exposureFilter = [[GPUImageExposureFilter alloc] init];
        exposureFilter.exposure = 0.1f;
        //对比度 0.0 ~ 4.0
        GPUImageContrastFilter *contrastFilter = [[GPUImageContrastFilter alloc] init];
        contrastFilter.contrast = 1.3f;
        //饱和度 0.0 ~ 2.0
        GPUImageSaturationFilter *saturationFilter = [[GPUImageSaturationFilter alloc] init];
        saturationFilter.saturation = 1.0f;
        /**
         原理：
         1. filterGroup(addFilter) 滤镜组添加每个滤镜
         2. 按添加顺序（可自行调整）前一个filter(addTarget) 添加后一个filter
         3. filterGroup.initialFilters = @[第一个filter]];
         4. filterGroup.terminalFilter = 最后一个filter;
         */
        
        //滤镜组
        [_filterGroup addFilter:brightnessFilter];
        [_filterGroup addFilter:exposureFilter];
        [_filterGroup addFilter:contrastFilter];
        [_filterGroup addFilter:saturationFilter];
        
        [brightnessFilter addTarget:exposureFilter];
        [exposureFilter addTarget:contrastFilter];
        [contrastFilter addTarget:saturationFilter];
        
        _filterGroup.initialFilters = @[brightnessFilter];
        _filterGroup.terminalFilter = saturationFilter;
        
    }
    return _filterGroup;
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
