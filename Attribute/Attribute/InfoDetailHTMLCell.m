//
//  InfoDetailHTMLCell.m
//  YouXuan
//
//  Created by dev on 2017/11/28.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "InfoDetailHTMLCell.h"

@interface InfoDetailHTMLCell()

@property (nonatomic, strong) UILabel *htmlLabel;

@end

@implementation InfoDetailHTMLCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *htmlLabel = [UILabel new];
        htmlLabel.numberOfLines = 0;
        htmlLabel.backgroundColor = [UIColor purpleColor];
        [htmlLabel sizeToFit];
        [self addSubview:htmlLabel];
        
        self.htmlLabel = htmlLabel;
        
        //layout
        [htmlLabel makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).offset(UIEdgeInsetsMake(0, 15, 0, 15));
        }];

    }
    return self;
}

- (void)reloadDataWithArticleContent:(NSString *)articleContent{

    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[articleContent dataUsingEncoding:NSUnicodeStringEncoding]
                                                                            options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}
                                                                 documentAttributes:nil
                                                                              error:nil];
    self.htmlLabel.attributedText = attributedString;
    
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
