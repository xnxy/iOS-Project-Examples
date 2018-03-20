//
//  TableViewController.m
//  Attribute
//
//  Created by dev on 2018/3/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "TableViewController.h"
#import "InfoDetailHTMLCell.h"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [self customTableViewWithFrame:CGRectZero
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
    
    [self.tableView registerClass:NSClassFromString(@"InfoDetailHTMLCell") forCellReuseIdentifier:TableViewCellIdentifier0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

static NSString* TableViewCellIdentifier0 = @"TableViewCellIdentifier0";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoDetailHTMLCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier0];
    [cell reloadDataWithArticleContent:[self contentString]];
    return cell;
}


- (NSString *)contentString{
    NSString *str = @"<p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p><p>今天在网上看到一些聊到学生时代的趣事，有关同桌的觉得很好玩，发出来让大家看看~</p>";
    return str;
}

- (UITableView *)customTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style separatorColor:(UIColor *)separatorColor estimatedSectionHeaderHeight:(CGFloat)headerHeight estimatedSectionFooterHeight:(CGFloat)footerHeight{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.separatorColor = separatorColor;
    tableView.estimatedSectionHeaderHeight = headerHeight;
    tableView.estimatedSectionFooterHeight = footerHeight;
    tableView.estimatedRowHeight = 44;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    return tableView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
