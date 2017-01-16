//
//  WeatherView.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "WeatherView.h"
#import "Public.h"
#import "UIViewController+LewPopupViewController.h"
#import "LewPopupViewAnimationFade.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "NetWorkSingleton.h"
#import "HXAddressManager.h"
#import "HXProvincialCitiesCountiesPickerview.h"



#define hRate(height) height/750
#define wRate(width) width/1334

@interface WeatherView ()

// xib
@property (strong, nonatomic)  UILabel *windLabel;// 风
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区
@property (strong, nonatomic)  UILabel *weatherLabel;// 天气情况
@property (strong, nonatomic)  UILabel *tmpLabel;// 温度范围
@property (strong, nonatomic)  UIImageView *weatherImg;// 天气icon
@property (strong, nonatomic)  UILabel *weekLabel;// 实时温度
@property (strong, nonatomic)  UILabel *aLineLabel;// 竖线
@property (strong, nonatomic)  UIImageView *bg_img;// 背景图

/**
 * 放大后的视图
 */
@property (nonatomic, strong) UIImageView *bgimg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UILabel *weekTmp;
@property (nonatomic, strong) UILabel *dTmpNow;
@property (nonatomic, strong) UIImageView *dWeatherImg;
@property (nonatomic, strong) UILabel *dTmpLabel;
@property (nonatomic, strong) UILabel *dWeatherLabel;
@property (nonatomic, strong) UILabel *dWindLabel;


@property (nonatomic,strong) HXProvincialCitiesCountiesPickerview *regionPickerView;


@end

@implementation WeatherView




- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupXib];
    
    
}



- (void)setupXib
{
    [self loadDatawithCity:@"厦门"];
    
    self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
    _bg_img.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_bg_img];
    _bg_img.frame = CGRectMake(0, 0, 120*kScreenWidth/1334, 30*kScreenHeight/750);
    
    self.areaWeatherLabel = [[UILabel alloc] init];
    _areaWeatherLabel.text = @"厦门天气";
    _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
    _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
    _areaWeatherLabel.textColor = [UIColor whiteColor];
    [self addSubview:_areaWeatherLabel];
    _areaWeatherLabel.frame = CGRectMake(0, 0, 120*kScreenWidth/1334, 30*kScreenHeight/750);
    
    self.aLineLabel = [[UILabel alloc] init];
    _aLineLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_aLineLabel];
    _aLineLabel.frame = CGRectMake(10*kScreenWidth/1334, CGRectGetMaxY(self.areaWeatherLabel.frame)+13*kScreenHeight/750, 2*kScreenWidth/1334, 14*kScreenHeight/750);
    
    self.weekLabel = [[UILabel alloc] init];
    _weekLabel.textAlignment = NSTextAlignmentLeft;
    _weekLabel.font = [UIFont systemFontOfSize:7.0];
    _weekLabel.textColor = [UIColor whiteColor];
    [self addSubview:_weekLabel];
    _weekLabel.frame = CGRectMake(CGRectGetMaxX(_aLineLabel.frame)+3*kScreenWidth/1334, CGRectGetMaxY(self.areaWeatherLabel.frame)+10*kScreenHeight/750, 160*kScreenWidth/1334, 20*kScreenHeight/750);
    
    self.weatherImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"000"]];
    [self addSubview:_weatherImg];
    _weatherImg.frame = CGRectMake(10*kScreenWidth/1334, CGRectGetMaxY(_aLineLabel.frame)+40*kScreenHeight/750, 60*kScreenWidth/1334, 60*kScreenHeight/750);
    
    self.tmpLabel = [[UILabel alloc] init];
    _tmpLabel.textAlignment = NSTextAlignmentCenter;
    _tmpLabel.font = [UIFont systemFontOfSize:8.0];
    _tmpLabel.textColor = [UIColor whiteColor];
    [self addSubview:_tmpLabel];
    _tmpLabel.frame = CGRectMake(CGRectGetMaxX(_weatherImg.frame)+10*kScreenWidth/1334, CGRectGetMaxY(_aLineLabel.frame)+15*kScreenHeight/750, 120*kScreenWidth/1334, 30*kScreenHeight/750);
    
    self.weatherLabel = [[UILabel alloc] init];
    _weatherLabel.textAlignment = NSTextAlignmentCenter;
    _weatherLabel.font = [UIFont systemFontOfSize:8.0];
    _weatherLabel.textColor = [UIColor whiteColor];
    [self addSubview:_weatherLabel];
    _weatherLabel.frame = CGRectMake(CGRectGetMaxX(_weatherImg.frame)+10*kScreenWidth/1334, CGRectGetMaxY(_tmpLabel.frame)+10*kScreenHeight/750, 120*kScreenWidth/1334, 30*kScreenHeight/750);
    
    self.windLabel = [[UILabel alloc] init];
    _windLabel.textAlignment = NSTextAlignmentCenter;
    _windLabel.font = [UIFont systemFontOfSize:8.0];
    _windLabel.textColor = [UIColor whiteColor];
    [self addSubview:_windLabel];
    _windLabel.frame = CGRectMake(CGRectGetMaxX(_weatherImg.frame)+10*kScreenWidth/1334, CGRectGetMaxY(_weatherLabel.frame)+10*kScreenHeight/750, 120*kScreenWidth/1334, 30*kScreenHeight/750);
    
}

- (void)loadDatawithCity:(NSString *)city
{
    NSString *url = [NSString stringWithFormat:WEATHER_URL, city];
    
   [[NetWorkSingleton shareManager] getResultWithParameter:nil url:url showHUD:NO successBlock:^(id responseBody) {
       if (responseBody) {
           NSDictionary *dic = responseBody[@"data"];
           _model = [[WeatherModel alloc] init];
           if (dic != nil) {
               [_model setValuesForKeysWithDictionary:dic];
               
               _windLabel.text = _model.wind;
               _dWindLabel.text = _model.wind;
               
               _areaWeatherLabel.text = [NSString stringWithFormat:@"%@天气", _model.city];
               _titleLabel.text = [NSString stringWithFormat:@"%@天气", _model.city];
               
               _weatherLabel.text = _model.weather;
               _dWeatherLabel.text = _model.weather;
               
               _weekLabel.text = [NSString stringWithFormat:@"%@实时温度(实时:%@℃)", _model.week, _model.now_tmp];
               _weekTmp.text = [NSString stringWithFormat:@"%@实时温度", _model.week];
               
               _tmpLabel.text = [NSString stringWithFormat:@"%@℃~%@℃", _model.day_tmp, _model.night_tmp];
               _dTmpLabel.text = [NSString stringWithFormat:@"%@℃~%@℃", _model.day_tmp, _model.night_tmp];
               
               _dTmpNow.text = [NSString stringWithFormat:@"(实时:%@℃)", _model.now_tmp];
               
               [_weatherImg sd_setImageWithURL:[NSURL URLWithString:_model.img]];
               [_dWeatherImg sd_setImageWithURL:[NSURL URLWithString:_model.img]];
           }

       }
       
       
   } failureBlock:^(NSError *error) {
       
       
       
   }];
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _weatherView = [UIView new];
        
        _weatherView.frame = frame;
        _weatherView.backgroundColor = RGBA(47, 59, 100, 1.0);
        [self loadDetailView];
        [self addSubview:_weatherView];
    }
    return self;
}

/**
 * 创建放大视图
 */
+ (instancetype)defaultWeatherView
{
    return [[WeatherView alloc] initWithFrame:CGRectMake(0, 0, 107*3, 96*3)];
}


- (void)loadDetailView
{
    _bgimg = [[UIImageView alloc] init];
    _bgimg.image = [UIImage imageNamed:@"title_bg.png"];
    _bgimg.frame = CGRectMake(0, -6, kScreenWidth*264/1334, kScreenHeight*65/750);
    [_weatherView addSubview:_bgimg];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(0, 0, kScreenWidth*264/1334, kScreenHeight*40/750);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    [_weatherView addSubview:_titleLabel];
    
    _lineLabel = [[UILabel alloc] init];
    _lineLabel.frame = CGRectMake(20*kScreenWidth/1334, CGRectGetMaxY(_bgimg.frame) + 20*kScreenHeight/750, 4*kScreenWidth/1334, 60*kScreenHeight/750);
    _lineLabel.backgroundColor = [UIColor blueColor];
    [_weatherView addSubview:_lineLabel];
    
    _weekTmp = [[UILabel alloc] init];
    _weekTmp.frame = CGRectMake(CGRectGetMaxX(_lineLabel.frame) + 5*kScreenWidth/1334, CGRectGetMinY(_lineLabel.frame), 200*kScreenWidth/1334, 60*kScreenHeight/750);
    _weekTmp.font = [UIFont systemFontOfSize:15.0];
    _weekTmp.textColor = [UIColor whiteColor];
    [_weatherView addSubview:_weekTmp];
    
    _dTmpNow = [[UILabel alloc] init];
    _dTmpNow.frame = CGRectMake(CGRectGetMaxX(_weekTmp.frame), CGRectGetMinY(_weekTmp.frame), 200*kScreenWidth/1334, 60*kScreenHeight/750);
    _dTmpNow.font = [UIFont systemFontOfSize:15.0];
    _dTmpNow.textColor = [UIColor whiteColor];
    [_weatherView addSubview:_dTmpNow];
    
    _dWeatherImg = [[UIImageView alloc] init];
    _dWeatherImg.frame = CGRectMake(40*kScreenWidth/1334, CGRectGetMaxY(_dTmpNow.frame)+120*kScreenHeight/750, 150*kScreenWidth/1334, kScreenWidth*150/1334);
    [_weatherView addSubview:_dWeatherImg];
    
    _dTmpLabel = [[UILabel alloc] init];
    _dTmpLabel.frame = CGRectMake(CGRectGetMaxX(_dWeatherImg.frame) +80*kScreenWidth/1334, CGRectGetMaxY(_dTmpNow.frame) + 60*kScreenHeight/750, 250*kScreenWidth/1334, 80*kScreenHeight/1334);
    _dTmpLabel.font = [UIFont systemFontOfSize:20.0];
    _dTmpLabel.textColor = [UIColor whiteColor];
    _dTmpLabel.textAlignment = NSTextAlignmentCenter;
    [_weatherView addSubview:_dTmpLabel];
    
    _dWeatherLabel = [[UILabel alloc] init];
    _dWeatherLabel.frame = CGRectMake(CGRectGetMaxX(_dWeatherImg.frame) +80*kScreenWidth/1334, CGRectGetMaxY(_dTmpLabel.frame) + 60*kScreenHeight/750, 250*kScreenWidth/1334, 80*kScreenHeight/1334);
    _dWeatherLabel.font = [UIFont systemFontOfSize:20.0];
    _dWeatherLabel.textAlignment = NSTextAlignmentCenter;
    _dWeatherLabel.textColor = [UIColor whiteColor];
    [_weatherView addSubview:_dWeatherLabel];
    
    _dWindLabel = [[UILabel alloc] init];
    _dWindLabel.frame = CGRectMake(CGRectGetMaxX(_dWeatherImg.frame) +80*kScreenWidth/1334, CGRectGetMaxY(_dWeatherLabel.frame) + 60*kScreenHeight/750, 250*kScreenWidth/1334, 80*kScreenHeight/1334);
    _dWindLabel.font = [UIFont systemFontOfSize:20.0];
    _dWindLabel.textAlignment = NSTextAlignmentCenter;
    _dWindLabel.textColor = [UIColor whiteColor];
    [_weatherView addSubview:_dWindLabel];
    
    
    /**
     * 调用数据
     */
    _titleLabel.text = @"厦门";
    [self loadDatawithCity:_titleLabel.text];
    
    UIButton *selectArea = [UIButton buttonWithType:(UIButtonTypeSystem)];
    selectArea.frame = CGRectMake(0, -6, kScreenWidth*264/1334, kScreenHeight*65/750);
    [selectArea addTarget: self action:@selector(selectAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [_weatherView addSubview:selectArea];

}


- (void)selectAction:(UIButton *)sender
{
    NSString *address = _titleLabel.text;
    NSArray *array = [address componentsSeparatedByString:@" "];
    
    NSString *province = @"";//省
    NSString *city = @"";//市
    NSString *county = @"";//县
    if (array.count > 2) {
        province = array[0];
        city = array[1];
        county = array[2];
    } else if (array.count > 1) {
        province = array[0];
        city = array[1];
    } else if (array.count > 0) {
        province = array[0];
    }

    
    [self.regionPickerView showPickerWithProvinceName:province cityName:city countyName:county];
     
}

- (HXProvincialCitiesCountiesPickerview *)regionPickerView {
    if (!_regionPickerView) {
        _regionPickerView = [[HXProvincialCitiesCountiesPickerview alloc] initWithFrame:CGRectMake(0, -120*kScreenHeight/750, self.frame.size.width, self.frame.size.height)];
        
        __weak typeof(self) wself = self;
        _regionPickerView.completion = ^(NSString *provinceName,NSString *cityName,NSString *countyName) {
            __strong typeof(wself) self = wself;
            
//            NSLog(@"%@", cityName);
            if ([cityName length] ==0) {
                return;
            }else {
                self.titleLabel.text = [NSString stringWithFormat:@"%@ %@",provinceName,cityName];
                if ([cityName length] > 0) {
                    [self loadDatawithCity:cityName];
                    
                }else {
                    [self loadDatawithCity:provinceName];
                }
            
            }

        };
        [self addSubview:_regionPickerView];
    }
    return _regionPickerView;
}

@end
