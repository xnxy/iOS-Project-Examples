//
//  VCTablePanoView.m
//  PanoramaViewDemo
//
//  Created by dev on 2017/12/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VCTablePanoView.h"
#import "PanoramaViewCell.h"

@interface VCTablePanoView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation VCTablePanoView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];
}


- (void)setupTableView{
    
    UITableView *tableView = [UITableView customTableViewWithFrame:CGRectZero
                                                             style:UITableViewStylePlain
                                                    separatorColor:[UIColor clearColor]
                                      estimatedSectionHeaderHeight:0
                                      estimatedSectionFooterHeight:0];
    tableView.delegate      = self;
    tableView.dataSource    = self;
    self.tableView          = tableView;
    [self.view addSubview:tableView];
    
    //layout
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:TableViewCellIdentifier0];
    [tableView registerClass:NSClassFromString(@"PanoramaViewCell") forCellReuseIdentifier:TableViewCellIdentifier1];
    
}

#pragma mark ---
#pragma mark --- dataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

static NSString* TableViewCellIdentifier0 = @"TableViewCellIdentifier0";
static NSString* TableViewCellIdentifier1 = @"TableViewCellIdentifier1";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 4 == 3) {
        PanoramaViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier1];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier0];
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell isKindOfClass:[PanoramaViewCell class]]) {
        PanoramaViewCell *panoramaCell = (PanoramaViewCell *)cell;
        [panoramaCell willBeDisplayed:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell isKindOfClass:[PanoramaViewCell class]]) {
        PanoramaViewCell *panoramaCell = (PanoramaViewCell *)cell;
        [panoramaCell didStopDisplayed:indexPath.row];
    }
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
