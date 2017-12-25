//
//  PanoramaViewCell.h
//  PanoramaViewDemo
//
//  Created by dev on 2017/12/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanoramaViewCell : UITableViewCell

- (void)willBeDisplayed:(NSUInteger)index;
- (void)didStopDisplayed:(NSUInteger)index;

@end
