//
//  CN3WMUserAnalysis.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMUserAnalysis.h"
#import "NetWorkSingleton.h"
#import "URL.h"
#import "PersonBase.h"

@interface CN3WMUserAnalysis ()

@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区

@end

@implementation CN3WMUserAnalysis

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatXIBUI];
        [self loadData];
    }
    return self;
}



- (void)creatXIBUI
{
    self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
    _bg_img.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_bg_img];
    _bg_img.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
    
    self.areaWeatherLabel = [[UILabel alloc] init];
    _areaWeatherLabel.text = @"各社区人口分布";
    _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
    _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
    _areaWeatherLabel.textColor = [UIColor whiteColor];
    [self addSubview:_areaWeatherLabel];
    _areaWeatherLabel.frame = CGRectMake(0, 0, 150*kScreenWidth/1334, 30*kScreenHeight/750);
    
    for (int i = 0; i < 6; i++) {
        PersonBase *personBaseView = [[PersonBase alloc] initWithFrame:CGRectMake(12*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame)+10*kScreenHeight/750 + i*53*kScreenHeight/750, self.frame.size.width-24*kScreenWidth/1334, 50*kScreenHeight/750)];
        personBaseView.tag = 200+i;
        [self addSubview:personBaseView];
    }
    
}

- (void)loadData
{
    /*
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:HYFBURL showHUD:YES successBlock:^(id responseBody) {
        
        NSArray *dataArr = responseBody[@"data"];
//        NSString *count = responseBody[@"qr_code_count"];
//        NSMutableArray *arr = [NSMutableArray array];
//        [arr addObject:count];
//        for (NSDictionary *dic in dataArr) {
//            NSString *numStr = dic[@"number"];
//            [arr addObject:numStr];
//        }
        
        for (int i = 0; i<dataArr.count; i++) {
            NSDictionary *paseDic = dataArr[i];
            [self parseValueByTag:paseDic tag:i];
        }
        
    } failureBlock:nil];
     */
    
    // 公安数据
    NSArray *dataArr = @[@{@"industry":@"坂上社区：", @"number":@"52"}, @{@"industry":@"围里社区：", @"number":@"27"}, @{@"industry":@"禾欣社区：", @"number":@"25"}, @{@"industry":@"枋湖社区：", @"number":@"42"}, @{@"industry":@"岭下社区：", @"number":@"33"}, @{@"industry":@"钟宅社区：", @"number":@"29"}];
    
    for (int i = 0; i<dataArr.count; i++) {
        NSDictionary *paseDic = dataArr[i];
        [self parseValueByTag:paseDic tag:i];
    }
    
}

- (void)parseValueByTag:(NSDictionary *)dic tag:(NSInteger)tag
{
    
    PersonBase *view = (PersonBase *)[self viewWithTag:200+tag];
    view.areaLabel.text = dic[@"industry"];
    view.numLabel.text = dic[@"number"];
    
}

@end
