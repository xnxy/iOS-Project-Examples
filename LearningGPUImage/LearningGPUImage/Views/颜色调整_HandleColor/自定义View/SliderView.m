//
//  SliderView.m
//  LearningGPUImage
//
//  Created by dev on 2017/12/28.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "SliderView.h"

@interface SliderView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation SliderView

- (instancetype)initWithFrame:(CGRect)frame name:(NSString *)name minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue defaultValue:(CGFloat)defaultValue{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *nameLabel = [UILabel new];
        nameLabel.font     = [UIFont fontWithName:@"Heiti SC" size:10.f];
        nameLabel.text     = name;
        
        UILabel *valueLabel = [UILabel new];
        valueLabel.font     = [UIFont fontWithName:@"Heiti SC" size:10.f];
        valueLabel.textAlignment = NSTextAlignmentRight;
        valueLabel.text = [NSString stringWithFormat:@"%.2f",defaultValue];
        
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
        slider.minimumTrackTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.1f];
        slider.maximumTrackTintColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
        [slider setThumbImage:[UIImage imageNamed:@"slider"] forState:UIControlStateNormal];
        slider.minimumValue = minValue;
        slider.maximumValue = maxValue;
        slider.value = defaultValue;
        self.changeValue = defaultValue;
        
        [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:nameLabel];
        [self addSubview:valueLabel];
        [self addSubview:slider];
        
        self.nameLabel = nameLabel;
        self.valueLabel = valueLabel;
        self.slider = slider;
        
        //layout
        [slider makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.equalTo(20);
        }];
        
        [nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self);
            make.bottom.equalTo(slider.top).offset(-5);
        }];
        
        [valueLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(self);
            make.bottom.equalTo(slider.top).offset(-5);
        }];
        
    }
    return self;
}

- (void)sliderChanged:(UISlider *)slider{
    self.changeValue = slider.value;
    self.slider.value = slider.value;
    [self.slider setValue:slider.value animated:YES];
    self.valueLabel.text = [NSString stringWithFormat:@"%.2f",slider.value];
}

@end
