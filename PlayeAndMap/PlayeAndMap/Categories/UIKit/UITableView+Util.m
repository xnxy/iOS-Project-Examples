//
//  UITableView+Util.m
//  YouXuan
//
//  Created by dev on 2017/10/30.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "UITableView+Util.h"

@implementation UITableView (Util)

+ (UITableView *)customTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style separatorColor:(UIColor *)separatorColor estimatedSectionHeaderHeight:(CGFloat)headerHeight estimatedSectionFooterHeight:(CGFloat)footerHeight{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.separatorColor = separatorColor;
    tableView.estimatedSectionHeaderHeight = headerHeight;
    tableView.estimatedSectionFooterHeight = footerHeight;
    tableView.estimatedRowHeight = 44;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    return tableView;
}


@end
