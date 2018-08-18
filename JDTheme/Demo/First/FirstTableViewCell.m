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
//    _imageView.jd_themeID = @"Style.image";
//    _firstLabel.jd_themeID = @"Style.title";
//    _secondLabel.jd_themeID = @"Style.detail";
    //上面三个在xib里面指定的哦
    _button.jd_themeID = @"Style.button";
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataInfo:(NSDictionary *)dataInfo {
    _firstLabel.text = dataInfo[@"title"];
    _secondLabel.text = dataInfo[@"detail"];
}

@end
