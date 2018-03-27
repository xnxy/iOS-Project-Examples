//
//  VCMap.m
//  PlayeAndMap
//
//  Created by dev on 2018/3/26.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "VCMap.h"

@interface VCMap ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) UIButton *gpsBtn;

@end

@implementation VCMap

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.mapView.delegate = self;
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(39.907728, 116.397968);
    self.mapView.showsUserLocation = YES;
    self.mapView.showsCompass = YES; // 指南针
    self.mapView.showsScale = NO; //比例尺
    
    self.gpsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.gpsBtn setImage:[UIImage imageNamed:@"gpsStat1"] forState:UIControlStateNormal];
    [self.gpsBtn addTarget:self action:@selector(gpsBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *zoomPannelView = [UIView new];
    
    UIButton *incBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [incBtn setImage:[UIImage imageNamed:@"increase"] forState:UIControlStateNormal];
    [incBtn addTarget:self action:@selector(zoomPlusAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *decBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [decBtn setImage:[UIImage imageNamed:@"decrease"] forState:UIControlStateNormal];
    [decBtn addTarget:self action:@selector(zoomMinusAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.gpsBtn];
    [self.view addSubview:zoomPannelView];
    [zoomPannelView addSubview:incBtn];
    [zoomPannelView addSubview:decBtn];
    
    //layout
    [self.gpsBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(20);
        make.bottom.equalTo(self.view.bottom).offset(-20);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    
    [zoomPannelView makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view).offset(-20);
        make.size.equalTo(CGSizeMake(53, 98));
    }];
    
    [incBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(zoomPannelView);
        make.height.equalTo(49);
    }];
    
    [decBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(zoomPannelView);
        make.top.equalTo(incBtn.bottom);
    }];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(self.mapView.userLocation.updating && self.mapView.userLocation.location) {
        [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
    }
    
}

#pragma mark ---
#pragma mark ---
- (void)gpsBtnAction{
    if(self.mapView.userLocation.updating && self.mapView.userLocation.location) {
        [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
        [self.gpsBtn setSelected:YES];
    }
}

#pragma mark ---
#pragma mark ---
- (void)zoomPlusAction{
    CGFloat oldZoom = self.mapView.zoomLevel;
    [self.mapView setZoomLevel:(oldZoom + 1) animated:YES];
}

#pragma mark ---
#pragma mark ---
- (void)zoomMinusAction{
    CGFloat oldZoom = self.mapView.zoomLevel;
    [self.mapView setZoomLevel:(oldZoom - 1) animated:YES];
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
