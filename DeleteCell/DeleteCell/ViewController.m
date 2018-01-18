//
//  ViewController.m
//  DeleteCell
//
//  Created by dev on 2018/1/18.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+SafeWrapper.h"
#import "NSMutableArray+SafeWrapper.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSoureAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.separatorColor = [UIColor clearColor];
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedRowHeight = 44;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    
    [tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:cellID];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSoureAry.count;
}

static NSString *cellID = @"cellID";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = [self.dataSoureAry objectAtIndexSafe:indexPath.row];
    return cell;
}

#pragma mark ---
#pragma mark --- 删除 ---
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    
    __weak typeof(self) weakSelf = self;
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf deleteCellWithIndexPath:indexPath];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    
    return @[deleteAction];
}

- (void)deleteCellWithIndexPath:(NSIndexPath *)indexPath{
    
    //删除数据源
    [self.dataSoureAry removeObjectAtIndexSafe:indexPath.row];
    //删除选中的行
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    
}

- (NSMutableArray *)dataSoureAry{
    if (!_dataSoureAry) {
        _dataSoureAry = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; i ++) {
            [_dataSoureAry addObject:[NSString stringWithFormat:@"cell%ld",i]];
        }
    }
    return _dataSoureAry;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
