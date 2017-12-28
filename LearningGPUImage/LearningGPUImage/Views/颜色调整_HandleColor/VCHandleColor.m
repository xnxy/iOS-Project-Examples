//
//  VCHandleColor.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/27.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VCHandleColor.h"

@interface VCHandleColor ()<TZImagePickerControllerDelegate>

@property (nonatomic, strong)UIImageView *imageView;

@property (nonatomic, strong)RangeValueView *brightnessRangeView;//亮度
@property (nonatomic, strong)RangeValueView *exposureRangeView;//曝光
@property (nonatomic, strong)RangeValueView *contrastRangeView; //对比度
@property (nonatomic, strong)RangeValueView *saturationRangeView; //饱和度

@property (nonatomic, strong) NSMutableArray<UIImage *> *selectedPhothAry; //选中的图片（image）
@property (nonatomic, strong) NSMutableArray            *selectedAssetAry; //选中的图片(Asset)

@end

@implementation VCHandleColor

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"颜色调整";
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    [self setupUI];
}

- (void)setupUI{
    
    UIImageView *imageView = [UIImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    
    RangeValueView *brightnessRangeView = [RangeValueView rangeValueViewWithFrame:CGRectMake(10, kSCREEN_HEIGHT - 100 - 40, kSCREEN_WIDTH - 20, 0)
                                                                             name:@"亮度 brightness"
                                                                         minValue:-1.f
                                                                         maxValue:1.f
                                                                     defaultValue:0.f];
    
    RangeValueView *exposureRangeView = [RangeValueView rangeValueViewWithFrame:CGRectMake(10, kSCREEN_HEIGHT - 100 - 40*2, kSCREEN_WIDTH - 20, 0)
                                                                             name:@"曝光 exposure"
                                                                         minValue:-10.f
                                                                         maxValue:10.f
                                                                     defaultValue:0.f];
    
    RangeValueView *contrastRangeView = [RangeValueView rangeValueViewWithFrame:CGRectMake(10, kSCREEN_HEIGHT - 100 - 40*3, kSCREEN_WIDTH - 20, 0)
                                                                             name:@"对比度 contrast"
                                                                         minValue:0.f
                                                                         maxValue:4.f
                                                                     defaultValue:1.f];
    
    RangeValueView *saturationRangeView = [RangeValueView rangeValueViewWithFrame:CGRectMake(10, kSCREEN_HEIGHT - 100 - 40*4, kSCREEN_WIDTH - 20, 0)
                                                                             name:@"饱和度 saturation"
                                                                         minValue:0.f
                                                                         maxValue:2.f
                                                                     defaultValue:1.f];
    
    //
    [self.view addSubview:imageView];
    [self.view addSubview:view];
    [self.view addSubview:brightnessRangeView];
    [self.view addSubview:exposureRangeView];
    [self.view addSubview:contrastRangeView];
    [self.view addSubview:saturationRangeView];
    
    self.imageView = imageView;
    self.brightnessRangeView = brightnessRangeView;
    self.exposureRangeView = exposureRangeView;
    self.contrastRangeView = contrastRangeView;
    self.saturationRangeView = saturationRangeView;
    
    //layout
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(100 + 40*4);
    }];
    
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(view.top);
    }];
    
    //action
    @weakify(self);
    [imageView bk_whenTapped:^{
        @strongify(self);
        [self selectImage];
    }];
    
    //亮度
    [[RACObserve(brightnessRangeView, currentValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         [self addBrightnessFilterWithBrightness:[number floatValue]];
     }];
    
    //曝光
    [[RACObserve(exposureRangeView, currentValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         [self addExposureFilterWithExposure:[number floatValue]];
     }];
    
    //对比度
    [[RACObserve(contrastRangeView, currentValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         [self addcontrastFilterWithContrast:[number floatValue]];
     }];
    
    //饱和度
    [[RACObserve(saturationRangeView, currentValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         [self addSaturationFilterWithSaturation:[number floatValue]];
     }];
    
}

#pragma mark ---
#pragma mark --- 饱和度 ---
//Saturation ranges from 0.0 (fully desaturated) to 2.0 (max saturation), with 1.0 as the normal level
static GPUImageSaturationFilter *saturationFilter = nil;
- (void)addSaturationFilterWithSaturation:(CGFloat)saturation{
    if (saturationFilter == nil) {
        saturationFilter = [[GPUImageSaturationFilter alloc]init];
    }
    saturationFilter.saturation = saturation;
    if (self.imageView.image) {
        [self changeFilter:saturationFilter image:self.imageView.image];
    }
}

#pragma mark ---
#pragma mark --- 对比度 ---
//Contrast ranges from 0.0 to 4.0 (max contrast), with 1.0 as the normal level
static GPUImageContrastFilter *contrastFilter = nil;
- (void)addcontrastFilterWithContrast:(CGFloat)contrast{
    if (contrastFilter == nil) {
        contrastFilter = [[GPUImageContrastFilter alloc] init];
    }
    contrastFilter.contrast = contrast;
    if (self.imageView.image) {
        [self changeFilter:contrastFilter image:self.imageView.image];
    }
    
}

#pragma mark ---
#pragma mark --- 曝光 ---
// Exposure ranges from -10.0 to 10.0, with 0.0 as the normal level
static GPUImageExposureFilter *exposureFilter = nil;
- (void)addExposureFilterWithExposure:(CGFloat)exposure{
    if (exposureFilter == nil) {
        exposureFilter = [[GPUImageExposureFilter alloc] init];
    }
    exposureFilter.exposure = exposure;
    if (self.imageView.image) {
        [self changeFilter:exposureFilter image:self.imageView.image];
    }
}

#pragma mark ---
#pragma mark --- 亮度滤镜 ---
//Brightness ranges from -1.0 to 1.0
static GPUImageBrightnessFilter *brightnessFilter = nil;
- (void)addBrightnessFilterWithBrightness:(CGFloat)brightness{
    if (brightnessFilter == nil) {
        brightnessFilter = [[GPUImageBrightnessFilter alloc]init];
    }
    brightnessFilter.brightness = brightness;
    if (self.imageView.image) {
        [self changeFilter:brightnessFilter image:self.imageView.image];
    }
}

#pragma mark ---
#pragma mark --- 添加滤镜 ---
static GPUImagePicture *imagePicture = nil;
- (void)changeFilter:(GPUImageOutput<GPUImageInput>*)filter image:(UIImage *)img{
    //设置图片渲染区域
    if (filter == nil) {
        [imagePicture removeAllTargets];
        return;
    }
    [filter forceProcessingAtSize:img.size];
    [filter useNextFrameForImageCapture];
    //获取数据源
    if (imagePicture == nil) {
        imagePicture = [[GPUImagePicture alloc] initWithImage:img];
    }
    //添加上滤镜
    [imagePicture addTarget:filter];
    //开始渲染
    [imagePicture processImage];
    //获取渲染后的图片
    UIImage *newImage = [filter imageFromCurrentFramebuffer];
    self.imageView.image = newImage;
}

#pragma mark ---
#pragma mark --- 图片 ----
- (void)selectImage{
    @weakify(self);
    [self showImagePickControllerWithMaxCount:1
                                     assetAry:nil
                                  finishBlock:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isOriginalPhoto)
     {
         @strongify(self);
         self.selectedPhothAry = [NSMutableArray arrayWithArray:photos];
         self.selectedAssetAry = [NSMutableArray arrayWithArray:assets];
         if (photos.count > 0) {
             self.imageView.image = [photos objectAtIndexSafe:0];
         }
     }];
}

#pragma mark ---
#pragma mark --- 选择图片 --
- (void)showImagePickControllerWithMaxCount:(NSInteger)maxCount assetAry:(NSMutableArray *)assetAry finishBlock:(void(^)(NSArray<UIImage *> *photos, NSArray *assets, BOOL isOriginalPhoto))finishBlock{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:maxCount
                                                                                            delegate:self];
    
    // 1.如果你需要将拍照按钮放在外面，不要传这个参数
    imagePickerVc.selectedAssets = assetAry; // optional, 可选的
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = NO;
    
    //    NSDictionary *navbarTitleTextAttributes = @{NSForegroundColorAttributeName:RGB_HEX(0x222222), NSFontAttributeName:[UIFont systemFontOfSize:kHeight(32)]};
    imagePickerVc.naviBgColor = [UIColor whiteColor];
    imagePickerVc.barItemTextFont = [UIFont systemFontOfSize:kHeight(32)];
    imagePickerVc.barItemTextColor = RGB_HEX(0x222222);
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        if (finishBlock) {
            finishBlock(photos, assets, isSelectOriginalPhoto);
        }
        
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
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
