//
//  CN3WMIndustrial.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMIndustrial.h"

@interface CN3WMIndustrial ()

@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区
@property (strong, nonatomic) UIImageView *analysisPic;

@end

@implementation CN3WMIndustrial

- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self=[super initWithFrame:frame]) {
        self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
        _bg_img.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bg_img];
        _bg_img.frame = CGRectMake(0, 0, 120*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.areaWeatherLabel = [[UILabel alloc] init];
        _areaWeatherLabel.text = @"人口分析";
        _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
        _areaWeatherLabel.textColor = [UIColor whiteColor];
        [self addSubview:_areaWeatherLabel];
        _areaWeatherLabel.frame = CGRectMake(0, 0, 120*kScreenWidth/1334, 30*kScreenHeight/750);

        self.analysisPic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rkfx"]];
        _analysisPic.frame = CGRectMake(0, CGRectGetMaxY(_areaWeatherLabel.frame), self.frame.size.width, self.frame.size.height-30*kScreenHeight/750);
        [self addSubview:_analysisPic];
        
    }
    
    return self;
}

@end
