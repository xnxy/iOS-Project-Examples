//
//  SegmentView.h
//  SegmentView
//
//  Created by dev on 2018/1/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickTouch)(UIButton *btn, NSInteger tag);

@interface SegmentView : UIView

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, copy)   ClickTouch clickTouch;

- (instancetype)initWithFrame:(CGRect)frame ary:(NSArray*)ary;

@end
