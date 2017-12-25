//
//  VCSinglePanoView.m
//  PanoramaViewDemo
//
//  Created by dev on 2017/12/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VCSinglePanoView.h"
#import "BSPanoramaView.h"


@interface VCSinglePanoView ()

@end

@implementation VCSinglePanoView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    BSPanoramaView *panoView = [[BSPanoramaView alloc] initWithFrame:CGRectZero];
    [panoView setImageWithName:@"test-2"];
//    [panoView setImageWithImageUrlString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514191856099&di=aa8293f39be2cfcc9e9d6540514fc95f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F3b87e950352ac65c6c018a4af0f2b21193138a87.jpg"];
    [self.view addSubview:panoView];
    
    //layout
    [panoView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
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
