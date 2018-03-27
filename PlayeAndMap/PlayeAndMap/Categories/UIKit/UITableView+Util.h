//
//  UITableView+Util.h
//  YouXuan
//
//  Created by dev on 2017/10/30.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Util)

//快速创建TableView
+ (UITableView *)customTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style separatorColor:(UIColor *)separatorColor estimatedSectionHeaderHeight:(CGFloat)headerHeight estimatedSectionFooterHeight:(CGFloat)footerHeight;

@end
