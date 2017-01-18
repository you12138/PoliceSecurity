//
//  MapView.m
//  DataAnalysisPlatform
//
//  Created by 温仲斌 on 2016/11/13.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "MapView.h"

@interface MapView ()

@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区

@end

@implementation MapView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
        _bg_img.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bg_img];
        _bg_img.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.areaWeatherLabel = [[UILabel alloc] init];
        _areaWeatherLabel.text = @"区域政府所在图";
        _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
        _areaWeatherLabel.textColor = [UIColor whiteColor];
        [self addSubview:_areaWeatherLabel];
        _areaWeatherLabel.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        UIImageView *picture = [[UIImageView alloc] initWithFrame:CGRectMake(20*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 10*kScreenHeight/750, 402*kScreenWidth/1334, 340*kScreenHeight/750)];
        picture.image = [UIImage imageNamed:@"map"];
        [self addSubview:picture];
        
    }
    return self;
}

@end
