//
//  VCStart.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/26.
//  Copyright © 2017年 dev. All rights reserved.
//

#define VCName  @"VCName"
#define VCDetail @"VCDetail"

#import "VCStart.h"

@interface VCStart ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation VCStart

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
}

#pragma mark ---
#pragma mark --- dataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataAry.count;
}

static NSString* TableViewCellIdentifier0 = @"TableViewCellIdentifier0";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier0];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[self.dataAry objectAtIndexSafe:indexPath.row]];
    cell.textLabel.text = [dic objectForKey:VCDetail];
    cell.detailTextLabel.text = [dic objectForKey:VCName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[self.dataAry objectAtIndexSafe:indexPath.row]];
    NSString *str = [dic objectForKey:VCName];
    if (str) {
        [self.navigationController pushViewController:[NSClassFromString(str) new] animated:YES];
    }
}

- (NSMutableArray *)dataAry{
    if (!_dataAry) {
        _dataAry = [NSMutableArray arrayWithObjects:@{VCName:@"VCHandleColor",
                                                      VCDetail: @"图片颜色调整"},
                                                    @{VCName:@"VideoHandleColor",
                                                      VCDetail: @"视频颜色调整"},nil];
    }
    return _dataAry;
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
