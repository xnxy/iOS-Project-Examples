//
//  ViewController.m
//  PlayeAndMap
//
//  Created by dev on 2018/3/26.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频  地图";
    
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
    
    [tableView registerClass:NSClassFromString(@"UITableViewCell")
      forCellReuseIdentifier:TableViewCellIdentifier1];
    
}

#pragma mark ---
#pragma mark --- dataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataAry.count;
}

static NSString* TableViewCellIdentifier1 = @"TableViewCellIdentifier1";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier1];
    cell.textLabel.text = [self.dataAry objectAtIndexSafe:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[NSClassFromString([self.dataAry objectAtIndexSafe:indexPath.row]) new]
                                         animated:YES];
}

- (NSMutableArray *)dataAry{
    if (!_dataAry) {
        _dataAry = [NSMutableArray array];
        [_dataAry addObject:@"VCPlayer"];
        [_dataAry addObject:@"VCPlayerList"];
        [_dataAry addObject:@"VCMap"];
        [_dataAry addObject:@"VCLife"];
    }
    return _dataAry;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
