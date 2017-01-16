//
//  HYFBTableViewCell.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/17.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "HYFBTableViewCell.h"
#import "NetWorkSingleton.h"
#import "URL.h"

/**
 * rgba颜色值
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface HYFBTableViewCell ()



@end

@implementation HYFBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setTypeSelected:(BOOL)typeSelected
{
    if (typeSelected) {
        
        self.homeLabel.textColor = [UIColor yellowColor];
        self.categoryLabel.textColor = [UIColor yellowColor];
        self.numberLabel.textColor = [UIColor yellowColor];
//        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
//        self.contentView.backgroundColor = [UIColor redColor];

    }else {
        self.homeLabel.textColor = [UIColor whiteColor];
        self.categoryLabel.textColor = [UIColor whiteColor];
        self.numberLabel.textColor = [UIColor whiteColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
