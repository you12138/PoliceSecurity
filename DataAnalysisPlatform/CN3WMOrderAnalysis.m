//
//  CN3WMOrderAnalysis.m
//  DataAnalysisPlatform
//
//  Created by 温仲斌 on 2016/11/13.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMOrderAnalysis.h"
#import "policeBase.h"

@interface CN3WMOrderAnalysis ()

@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区

@end

@implementation CN3WMOrderAnalysis

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
        _bg_img.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bg_img];
        _bg_img.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.areaWeatherLabel = [[UILabel alloc] init];
        _areaWeatherLabel.text = @"区域派出所民警";
        _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
        _areaWeatherLabel.textColor = [UIColor whiteColor];
        [self addSubview:_areaWeatherLabel];
        _areaWeatherLabel.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame), self.frame.size.width/3, 30*kScreenHeight/750)];
        nameLabel.text = @"民警姓名";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:8.0];
        [self addSubview:nameLabel];
        
        UILabel *netCount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), CGRectGetMaxY(_areaWeatherLabel.frame), self.frame.size.width/3, 30*kScreenHeight/750)];
        netCount.text = @"隶属网格员数量";
        netCount.textAlignment = NSTextAlignmentCenter;
        netCount.textColor = [UIColor whiteColor];
        netCount.font = [UIFont systemFontOfSize:8.0];
        [self addSubview:netCount];
        
        UILabel *personCount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(netCount.frame)-15*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame), self.frame.size.width/3, 30*kScreenHeight/750)];
        personCount.text = @"隶属人口数量";
        personCount.textAlignment = NSTextAlignmentCenter;
        personCount.textColor = [UIColor whiteColor];
        personCount.font = [UIFont systemFontOfSize:8.0];
        [self addSubview:personCount];
        
        NSArray *dataArr = @[@{@"name":@"邹警官", @"net":@"14", @"person":@"197175"},
                             @{@"name":@"陈警官", @"net":@"23", @"person":@"608478"},
                             @{@"name":@"周警官", @"net":@"22", @"person":@"82579"},
                             @{@"name":@"蔡警官", @"net":@"11", @"person":@"61710"},
                             @{@"name":@"李警官", @"net":@"14", @"person":@"397841"},
                             @{@"name":@"黄警官", @"net":@"12", @"person":@"34003"},
                             @{@"name":@"总计", @"net":@"14", @"person":@"1299207"}
                             ];
        
        for (int i = 0; i < 7; i ++) {
            policeBase *policeView = [[policeBase alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(personCount.frame)+i*20*kScreenHeight/750, self.frame.size.width-10, 20*kScreenHeight/750)];
            policeView.orderLabel.text = [NSString stringWithFormat:@"%d", i+1];
            NSDictionary *dic = dataArr[i];
            policeView.policeName.text = dic[@"name"];
            policeView.netNum.text = dic[@"net"];
            policeView.personCount.text = dic[@"person"];
            if (i == 6) {
                policeView.orderLabel.hidden = YES;
            }
            [self addSubview:policeView];
        }
        
    }
    return self;
}

@end
