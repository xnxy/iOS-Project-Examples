//
//  LifeCollectionViewCell.m
//  PlayeAndMap
//
//  Created by dev on 2018/4/9.
//  Copyright © 2018年 dev. All rights reserved.
//

#import "LifeCollectionViewCell.h"

@implementation LifeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor randomColor];
        
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        self.label = label;
        
        [self addSubview:label];
        
        //layout
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

@end
