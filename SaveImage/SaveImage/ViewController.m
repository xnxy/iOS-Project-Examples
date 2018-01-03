//
//  ViewController.m
//  SaveImage
//
//  Created by dev on 2018/1/2.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"
//#import <AssetsLibrary/AssetsLibrary.h>

#import "SavePhotoAlbum.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"001"];
    imageView.frame = CGRectMake(20, 30, 100, 100);
    self.imageView = imageView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, imageView.frame.origin.y + imageView.bounds.size.height + 20, 100, 50);
    [btn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *customPhotoAlbumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customPhotoAlbumBtn.backgroundColor = [UIColor blueColor];
    [customPhotoAlbumBtn setTitle:@"自定义相册" forState:UIControlStateNormal];
    [customPhotoAlbumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    customPhotoAlbumBtn.frame = CGRectMake(20, btn.frame.origin.y + btn.frame.size.height + 20, 100, 50);
    [customPhotoAlbumBtn addTarget:self action:@selector(savePhotoAlbumBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imageView];
    [self.view addSubview:btn];
    [self.view addSubview:customPhotoAlbumBtn];
    
}

#pragma mark ---
#pragma mark --- 保存图片到相机胶卷 ---
- (void)save:(UIButton *)btn{
    [SavePhotoAlbum savePhotoWithImage:self.imageView.image];
}

#pragma mark ---
#pragma mark --- 保存图片到自定义相册 ---
- (void)savePhotoAlbumBtn:(UIButton *)btn{
    
    [SavePhotoAlbum savePhotoWithImage:self.imageView.image albumName:@"抖音" completion:^(NSError *error) {
        
        NSString *str;
        if(error){
            str = @"保存失败";
        }else{
            str = @"保存成功";
        }
        
        NSLog(@"-----%@-----",str);
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
