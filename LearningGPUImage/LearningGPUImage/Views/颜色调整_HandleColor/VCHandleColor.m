//
//  VCHandleColor.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/27.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VCHandleColor.h"
#import "SliderView.h"
#import "ImageFilter.h"

@interface VCHandleColor ()<TZImagePickerControllerDelegate>

@property (nonatomic, strong)UIImageView *imageView;

@property (nonatomic, strong) NSMutableArray<UIImage *> *selectedPhothAry; //选中的图片（image）
@property (nonatomic, strong) NSMutableArray            *selectedAssetAry; //选中的图片(Asset)

@property (nonatomic, assign) BOOL imageChagne;

@end

@implementation VCHandleColor

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"颜色调整";
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    [self setupUI];
    
}

- (void)setupUI{
     @weakify(self);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"保存"
                                                                                 style:UIBarButtonItemStyleDone
                                                                               handler:^(id sender)
    {
        @strongify(self);
        if (self.imageView.image) {
            
            [SavePhotoAlbum savePhotoWithImage:self.imageView.image albumName:@"LearningGPUImage" completion:^(NSError *error) {
                
            }];
            
        }
    }];
    
    UIImageView *imageView = [UIImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    
    SliderView *brightnessRangeView = [[SliderView alloc] initWithFrame:CGRectZero
                                                                   name:@"亮度 brightness"
                                                               minValue:-1.f
                                                               maxValue:1.f
                                                           defaultValue:0.f];
    
    SliderView *exposureRangeView = [[SliderView alloc] initWithFrame:CGRectZero
                                                                 name:@"曝光 exposure"
                                                             minValue:-10.f
                                                             maxValue:10.f
                                                         defaultValue:0.f];
    
    SliderView *contrastRangeView = [[SliderView alloc] initWithFrame:CGRectZero
                                                                 name:@"对比度 contrast"
                                                             minValue:0.f
                                                             maxValue:4.f
                                                         defaultValue:1.f];
    
    SliderView *saturationRangeView = [[SliderView alloc] initWithFrame:CGRectZero
                                                                   name:@"饱和度 saturation"
                                                               minValue:0.f
                                                               maxValue:2.f
                                                           defaultValue:1.f];
    
    //
    [self.view addSubview:imageView];
    [self.view addSubview:view];
    [view addSubview:brightnessRangeView];
    [view addSubview:exposureRangeView];
    [view addSubview:contrastRangeView];
    [view addSubview:saturationRangeView];
    
    self.imageView = imageView;
    
    //layout
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(100 + 40*4);
    }];
    
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(view.top);
    }];
    
    //亮度
    [brightnessRangeView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(10);
        make.right.equalTo(view.right).offset(-10);
    }];
    
    //曝光
    [exposureRangeView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(brightnessRangeView);
        make.top.equalTo(brightnessRangeView.bottom).offset(10);
    }];
    
    //对比度
    [contrastRangeView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(brightnessRangeView);
        make.top.equalTo(exposureRangeView.bottom).offset(10);
    }];
    
    //饱和度
    [saturationRangeView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(brightnessRangeView);
        make.top.equalTo(contrastRangeView.bottom).offset(10);
    }];
    
    //action
   
    [imageView bk_whenTapped:^{
        @strongify(self);
        [self selectImage];
    }];
    
    //亮度
    [[RACObserve(brightnessRangeView, changeValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         self.imageView.image = [ImageFilter imageBrightnessFilter:[number floatValue] image:self.imageView.image imageChange:self.imageChagne];
         self.imageChagne = NO;
     }];
    
    //曝光
    [[RACObserve(exposureRangeView, changeValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         self.imageView.image = [ImageFilter imageExposureFilter:[number floatValue] image:self.imageView.image imageChange:self.imageChagne];
         self.imageChagne = NO;
     }];
    
    //对比度
    [[RACObserve(contrastRangeView, changeValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         self.imageView.image = [ImageFilter imageContrastFilter:[number floatValue] image:self.imageView.image imageChange:self.imageChagne];
         self.imageChagne = NO;
     }];
    
    //饱和度
    [[RACObserve(saturationRangeView, changeValue) takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(NSNumber *number) {
         @strongify(self);
         self.imageView.image = [ImageFilter imageSaturationFilter:[number floatValue] image:self.imageView.image imageChange:self.imageChagne];
         self.imageChagne = NO;
     }];
    
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
             self.imageChagne = YES;
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
