//
//  RecordEncoder.m
//  LearningGPUImage
//
//  Created by dev on 2018/1/4.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "RecordEncoder.h"

@interface RecordEncoder()

@property (nonatomic, strong) NSMutableDictionary *videoSetDic; //视频设置

@end

@implementation RecordEncoder

- (instancetype)initVideoName:(NSString *)videoName channels:(int)channels samples:(Float64)samples{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark ---
#pragma mark --- 视频设置 ---
- (NSMutableDictionary *)videoSetDic{
    if (!_videoSetDic) {
        _videoSetDic = [NSMutableDictionary dictionary];
        [_videoSetDic setObject:AVVideoCodecH264 forKey:AVVideoCodecKey]; //视频编码方式
        NSNumber *videoWidth = [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.width]; //视频宽高 最后设置为videoCamera的宽高
        NSNumber *videoHeight = [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.height];
        [_videoSetDic setObject:videoWidth forKey:AVVideoWidthKey]; //视频的宽度
        [_videoSetDic setObject:videoHeight forKey:AVVideoHeightKey]; //视频的高
    }
    return _videoSetDic;
}

#pragma mark ---
#pragma mark --- 音频输入设置 ---
- (NSMutableDictionary *)audioInputChanels:(int)chanels sampleRate:(Float64)sampleRate{
    //音频的一些设置  包括AAC、音频通道、采样率和音频的比特率
    NSMutableDictionary *audioDic = [NSMutableDictionary dictionary];
    [audioDic setObject:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey]; //AAC
    [audioDic setObject:[NSNumber numberWithInt:chanels] forKey:AVNumberOfChannelsKey]; //音频通道
    [audioDic setObject:[NSNumber numberWithFloat:sampleRate] forKey:AVSampleRateKey]; //采样率
    [audioDic setObject:[NSNumber numberWithInt:128000] forKey:AVEncoderBitRateKey]; //音频的比特率
    
    return audioDic;
    
}

@end
