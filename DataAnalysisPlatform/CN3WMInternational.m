//
//  CN3WMInternational.m
//  DataAnalysisPlatform
//
//  Created by 温仲斌 on 2016/11/13.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMInternational.h"

@interface CN3WMInternational ()

@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区
@property (strong, nonatomic)  UIImageView *bg_pictuce;

@end

@implementation CN3WMInternational

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
        _bg_img.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bg_img];
        _bg_img.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.areaWeatherLabel = [[UILabel alloc] init];
        _areaWeatherLabel.text = @"房屋类型";
        _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
        _areaWeatherLabel.textColor = [UIColor whiteColor];
        [self addSubview:_areaWeatherLabel];
        _areaWeatherLabel.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.bg_pictuce = [[UIImageView alloc] initWithFrame:CGRectMake(20*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 5*kScreenHeight/750, self.frame.size.width-40*kScreenWidth/1334, self.frame.size.height-40*kScreenHeight/750)];
        _bg_pictuce.image = [UIImage imageNamed:@"fwlx"];
        [self addSubview:_bg_pictuce];

    }
    return self;
}

@end
