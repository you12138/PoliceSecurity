//
//  CN3WMTradeView.m
//  DataAnalysisPlatform
//
//  Created by 温仲斌 on 2016/11/13.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMTradeView.h"

@interface CN3WMTradeView ()
@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区
@end

@implementation CN3WMTradeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
        _bg_img.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_bg_img];
        _bg_img.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        self.areaWeatherLabel = [[UILabel alloc] init];
        _areaWeatherLabel.text = @"禾山所人口统计";
        _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
        _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
        _areaWeatherLabel.textColor = [UIColor whiteColor];
        [self addSubview:_areaWeatherLabel];
        _areaWeatherLabel.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
        
        NSArray *title_arr = @[@"禾山派出所人口", @"本地人口", @"外籍人口", @"无户籍人口", @"流动人口"];
        for (int i = 0; i < title_arr.count; i ++) {
            
            // 标题
            if (i < 2) {
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(55*kScreenWidth/1334 + i*231*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 10*kScreenHeight/750, 100*kScreenWidth/1334, 20*kScreenHeight/750)];
                label.text = title_arr[i];
                label.textAlignment = NSTextAlignmentCenter;
                label.textColor = [UIColor whiteColor];
                label.font = [UIFont systemFontOfSize:7.0];
                [self addSubview:label];
            } else {
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(36*kScreenWidth/1334 + (i-2)*130*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 75*kScreenHeight/750, 80*kScreenWidth/1334, 20*kScreenHeight/750)];
                label.text = title_arr[i];
                label.textAlignment = NSTextAlignmentCenter;
                label.textColor = [UIColor whiteColor];
                label.font = [UIFont systemFontOfSize:7.0];
                [self addSubview:label];
            }
            
        }
        
        // 数量
        for (int i = 0; i < 16; i++) {
            if (i < 8) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 35*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                imageView.image = [UIImage imageNamed:@"使用用户"];
                [self addSubview:imageView];
                UILabel *text_la = [[UILabel alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 35*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                text_la.text = @"0";
                text_la.tag = 500+i;
                text_la.textAlignment = NSTextAlignmentCenter;
                text_la.textColor = [UIColor whiteColor];
                text_la.font = [UIFont systemFontOfSize:10.0];
                [self addSubview:text_la];
            }else{
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(65*kScreenWidth/1334 + i*22*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 35*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                imageView.image = [UIImage imageNamed:@"使用用户"];
                [self addSubview:imageView];
                UILabel *text_la = [[UILabel alloc] initWithFrame:CGRectMake(65*kScreenWidth/1334 + i*22*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 35*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                text_la.text = @"0";
                text_la.tag = 500+i;
                text_la.textAlignment = NSTextAlignmentCenter;
                text_la.textColor = [UIColor whiteColor];
                text_la.font = [UIFont systemFontOfSize:10.0];
                [self addSubview:text_la];
            }
        }
        
        for (int i = 0; i < 16; i ++) {
            if (i < 5) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 95*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                imageView.image = [UIImage imageNamed:@"使用用户"];
                [self addSubview:imageView];
                UILabel *text_la = [[UILabel alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 95*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                text_la.text = @"0";
                text_la.tag = 600+i;
                text_la.textAlignment = NSTextAlignmentCenter;
                text_la.textColor = [UIColor whiteColor];
                text_la.font = [UIFont systemFontOfSize:10.0];
                [self addSubview:text_la];
            }else if(i>4&&i<9){
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334 + 20*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 95*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                imageView.image = [UIImage imageNamed:@"使用用户"];
                [self addSubview:imageView];
                UILabel *text_la = [[UILabel alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334 + 20*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 95*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                text_la.text = @"0";
                text_la.tag = 600+i;
                text_la.textAlignment = NSTextAlignmentCenter;
                text_la.textColor = [UIColor whiteColor];
                text_la.font = [UIFont systemFontOfSize:10.0];
                [self addSubview:text_la];
            }else {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334 + 40*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 95*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                imageView.image = [UIImage imageNamed:@"使用用户"];
                [self addSubview:imageView];
                UILabel *text_la = [[UILabel alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334 + i*22*kScreenWidth/1334 + 40*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 95*kScreenHeight/750, 22*kScreenWidth/1334, 35*kScreenHeight/750)];
                text_la.text = @"0";
                text_la.tag = 600+i;
                text_la.textAlignment = NSTextAlignmentCenter;
                text_la.textColor = [UIColor whiteColor];
                text_la.font = [UIFont systemFontOfSize:10.0];
                [self addSubview:text_la];

            }
        }
        
        UIImageView *picture = [[UIImageView alloc] initWithFrame:CGRectMake(25*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame) + 160*kScreenHeight/750, 400*kScreenWidth/1334, 135*kScreenHeight/750)];
        picture.image = [UIImage imageNamed:@"rkcc"];
        [self addSubview:picture];
        
    }
    return self;
}

@end
