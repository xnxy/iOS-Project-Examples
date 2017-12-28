//
//  JWWebViwController.m
//  YouXuan
//
//  Created by dev on 2017/11/18.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "JWWebViwController.h"
#import <WebKit/WKWebView.h>

@interface JWWebViwController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation JWWebViwController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.titleStr;
    
    [self setupWebView];
}

- (void)setupWebView{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    [webView loadRequest:request];
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectZero];
    progressView.tintColor = RGB_HEX(0x222222);
    progressView.trackTintColor = [UIColor whiteColor];
    
    [self.view addSubview:webView];
    [self.view addSubview:progressView];
    
    self.webView = webView;
    self.progressView = progressView;
    
    //layout
    [webView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [progressView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(SEP_LINE_SIZE);
    }];
    
    @weakify(self);
    [[[RACObserve(webView, estimatedProgress)takeUntil:self.rac_willDeallocSignal]
     deliverOn:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(NSNumber *x) {
         @strongify(self);
         if ([x floatValue] >= 1) {
             self.progressView.hidden = YES;
             [self.progressView setProgress:0 animated:YES];
         }else{
             self.progressView.hidden = NO;
             [self.progressView setProgress:[x floatValue] animated:YES];
         }
     }];
    
    [[[RACObserve(webView, title) takeUntil:self.rac_willDeallocSignal]
      deliverOn:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(NSString *x) {
         @strongify(self);
         self.title = x;
     }];
    
    //右侧加上刷新按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                             handler:^(id sender)
    {
        [webView reload];
    }];
    
}

- (void)dealloc{
    self.webView.scrollView.delegate = nil;
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
