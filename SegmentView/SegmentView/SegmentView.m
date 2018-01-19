//
//  SegmentView.m
//  SegmentView
//
//  Created by dev on 2018/1/19.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "SegmentView.h"

@interface SegmentView()

@property (nonatomic, strong) NSMutableArray *buttonAry;

@property (nonatomic, strong) UIButton *previousButton; //标记Btn

@end

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame ary:(NSArray*)ary{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.buttonAry = [NSMutableArray arrayWithCapacity:ary.count];
        
        //
        CGFloat width = kSCREEN_WIDTH/ary.count;
        for (NSUInteger i = 0; i < ary.count; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            UIColor *backgroundColor;
            if (self.selectedIndex == i) {
                backgroundColor = [UIColor redColor];
                self.previousButton = button;
            }else{
                backgroundColor = [UIColor whiteColor];
            }
            button.backgroundColor = backgroundColor;
            [button setTitle:ary[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self
                       action:@selector(clickButtonItem:)
             forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            
            [button setImageEdgeInsets:UIEdgeInsetsMake(0.0, -6, 0.0, 0.0)];
            
            [self.buttonAry addObject:button];
            [self addSubview:button];
            
            //layout
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.left.equalTo(width * i);
                make.width.equalTo(width);
                make.bottom.equalTo(self.bottom);
            }];
            
        }
        
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex{
    if (selectedIndex >= self.buttonAry.count || selectedIndex < 0) {
        return;
    }
    UIButton *btn = [self.buttonAry objectAtIndex:selectedIndex];
    [self clickButtonItem:btn];
}

- (void)clickButtonItem:(UIButton *)btn{
    if (self.previousButton == btn) {
        return;
    }
    btn.backgroundColor = [UIColor redColor];
    self.previousButton.backgroundColor = [UIColor whiteColor];
    self.previousButton = btn;
    
    self.clickTouch(btn, btn.tag);
    
}

@end
