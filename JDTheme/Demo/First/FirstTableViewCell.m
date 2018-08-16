//
//  FirstTableViewCell.m
//  JDTheme
//
//  Created by JD on 2018/8/15.
//  Copyright © 2018年 JD. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "JDTheme.h"

@implementation FirstTableViewCell {
    __weak IBOutlet UIImageView *_imageView;
    __weak IBOutlet UILabel *_firstLabel;
    __weak IBOutlet UILabel *_secondLabel;
    __weak IBOutlet UIButton *_button;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataInfo:(NSDictionary *)dataInfo {
    _imageView.jd_theme_key = @"Style.image";
    _firstLabel.jd_theme_key = @"Style.button";
    _secondLabel.jd_theme_key = @"Style.button";
    _button.jd_theme_key = @"Style.button";
}

@end
