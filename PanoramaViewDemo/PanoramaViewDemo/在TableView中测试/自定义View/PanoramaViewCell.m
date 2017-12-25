//
//  PanoramaViewCell.m
//  PanoramaViewDemo
//
//  Created by dev on 2017/12/19.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "PanoramaViewCell.h"
#import "BSPanoramaView.h"

@interface PanoramaViewCell ()

@property (nonatomic, strong) BSPanoramaView *panoramaView;

@end

@implementation PanoramaViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.panoramaView = [[BSPanoramaView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.panoramaView];
        
        //layout
        [self.panoramaView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.height.equalTo(300);
        }];
        
    }
    return self;
}

- (void)willBeDisplayed:(NSUInteger)index{
    [self.panoramaView setImageWithName:@"test-2"];
}

- (void)didStopDisplayed:(NSUInteger)index{
    [self.panoramaView unloadImage];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
