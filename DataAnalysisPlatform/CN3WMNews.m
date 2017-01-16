//
//  CN3WMNews.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMNews.h"
#import "NewsBaseView.h"
#import "NetWorkSingleton.h"
#import "URL.h"

@interface CN3WMNews ()

@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区
@property (strong, nonatomic) UIImageView *bg_picture;

@end

@implementation CN3WMNews

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
        _bg_img.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bg_img];
        _bg_img.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.areaWeatherLabel = [[UILabel alloc] init];
        _areaWeatherLabel.text = @"区域人员身份统计";
        _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
        _areaWeatherLabel.textColor = [UIColor whiteColor];
        [self addSubview:_areaWeatherLabel];
        _areaWeatherLabel.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.bg_picture = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sftj"]];
        _bg_picture.frame = CGRectMake(0, CGRectGetMaxY(_areaWeatherLabel.frame)+5*kScreenHeight/750, self.frame.size.width, self.frame.size.height-_areaWeatherLabel.frame.size.height - 10*kScreenHeight/750);
        [self addSubview:self.bg_picture];
    }
    return self;
}

- (void)loadData
{
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:NEWS_INDUSTRY showHUD:YES successBlock:^(id responseBody) {
        
//        NSLog(@"%@", responseBody);
        NSArray *arr = responseBody[@"data"];
        for (int i = 0; i < 6; i ++) {
            NSDictionary *dic = arr[i];
            NewsBaseView *newsbaseView = [[NewsBaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bottomLabel.frame)+3 + i*12, 110, 10)];
            newsbaseView.websiteLabel.text = dic[@"media"];
            newsbaseView.reportNumLabel.text = dic[@"report_number"];
            newsbaseView.pageViewLabel.text = dic[@"browse_number"];
            [self addSubview:newsbaseView];
            
        }
        
    } failureBlock:nil];
}

@end
