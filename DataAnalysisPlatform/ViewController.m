//
//  ViewController.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "ViewController.h"
#import "Public.h"
#import "LewPopupViewController.h"
#import "NetWorkSingleton.h"
#import "WeatherModel.h"
#import "MJExtension.h"


#import "AlertHYFB.h"

@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = RGBA(2, 12, 49, 1.0);
    
    [self loadMyView];
    
}

- (void)loadMyView
{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20*kScreenHeight/750)];
    NSLog(@"%f", kScreenHeight);
    titleLabel.backgroundColor = RGBA(8, 38, 208, 1.0);
    titleLabel.text = @"厦门市人口基础数据云平台";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:8.0];
    titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:titleLabel];
    
    WeatherView *weatherView  = [[NSBundle mainBundle] loadNibNamed:@"WeatherView" owner:nil options:nil].firstObject;
    weatherView.frame = CGRectMake(0, 11*2*kScreenHeight/750, 107*2*kScreenWidth/1334, 96*2*kScreenHeight/750);
    weatherView.backgroundColor = RGBA(47, 59, 100, 1.0);
    
    UIButton *clickBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    clickBtn.frame = CGRectMake(0, 11*2*kScreenHeight/750, 107*2*kScreenWidth/1334, 96*2*kScreenHeight/750);
    [clickBtn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
//    clickBtn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:weatherView];
    [self.view addSubview:clickBtn];
    
    
    CN3WMUser *userView = [[NSBundle mainBundle] loadNibNamed:@"CN3WMUser" owner:nil options:nil].firstObject;
    userView.frame = CGRectMake(0, 108*2*kScreenHeight/750, 107*2*kScreenWidth/1334, 89*2*kScreenHeight/750);
    userView.backgroundColor = RGBA(47, 59, 100, 1.0);
    UIButton *clickUser = [UIButton buttonWithType:(UIButtonTypeSystem)];
//    clickUser.backgroundColor = [UIColor redColor];
    clickUser.frame = CGRectMake(0, 108*2*kScreenHeight/750, 107*2*kScreenWidth/1334, 89*2*kScreenHeight/750);
    [clickUser addTarget:self action:@selector(btnclickUser:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:userView];
    [self.view addSubview:clickUser];
    
    
    // 人口分析
    CN3WMIndustrial *industrialView = [[CN3WMIndustrial alloc] initWithFrame:CGRectMake(0, 197.8*2*kScreenHeight/750, 223*2*kScreenWidth/1334, 83*2*kScreenHeight/750)];
    industrialView.backgroundColor = RGBA(47, 59, 100, 1.0);
    [self.view addSubview:industrialView];
    
    
    // 人口分布
    CN3WMUserAnalysis *UserAnalysisView = [[CN3WMUserAnalysis alloc] initWithFrame:CGRectMake(108*2*kScreenWidth/1334, 11*2*kScreenHeight/750, 115*2*kScreenWidth/1334, 186*2*kScreenHeight/750)];
    UserAnalysisView.backgroundColor = RGBA(47, 59, 100, 1.0);
    
    UIButton *userAnalysisBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    userAnalysisBtn.frame = CGRectMake(108*2*kScreenWidth/1334, 11*2*kScreenHeight/750, 115*2*kScreenWidth/1334, 186*2*kScreenHeight/750);
    [userAnalysisBtn addTarget:self action:@selector(userAnalysisAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:UserAnalysisView];
    [self.view addSubview:userAnalysisBtn];
    
    // 区域人员身份统计
    CN3WMNews *newsView = [[CN3WMNews alloc] initWithFrame:CGRectMake(0, 282*2*kScreenHeight/750, 223*2*kScreenWidth/1334, 93*2*kScreenHeight/750)];
    newsView.backgroundColor = RGBA(47, 59, 100, 1.0);
    [self.view addSubview:newsView];
    /*
    CN3WMWebsite *webSiteView = [[NSBundle mainBundle] loadNibNamed:@"CN3WMWebsite" owner:nil options:nil].firstObject;
    webSiteView.backgroundColor = RGBA(47, 59, 100, 1.0);
    webSiteView.frame = CGRectMake(111*2*kScreenWidth/1334, 282*2*kScreenHeight/750, 112*2*kScreenWidth/1334, 93*2*kScreenHeight/750);
    
    UIButton *clickWebSite = [UIButton buttonWithType:(UIButtonTypeSystem)];
    clickWebSite.frame = CGRectMake(111*2*kScreenWidth/1334, 282*2*kScreenHeight/750, 112*2*kScreenWidth/1334, 93*2*kScreenHeight/750);
    [clickWebSite addTarget:self action:@selector(webSiteViewAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:webSiteView];
    [self.view addSubview:clickWebSite];
    */
    
    
    CN3WMTradeView *tradeView = [[NSBundle mainBundle] loadNibNamed:@"CN3WMTradeView" owner:nil options:nil].firstObject;
    tradeView.backgroundColor = RGBA(47, 59, 100, 1.0);
    tradeView.frame = CGRectMake(448*kScreenWidth/1334, 22*kScreenHeight/750, 442*kScreenWidth/1334, 336*kScreenHeight/750);
    [self.view addSubview:tradeView];
    
    MapView *mapView = [[NSBundle mainBundle] loadNibNamed:@"MapView" owner:nil options:nil].firstObject;
    mapView.backgroundColor = RGBA(47, 59, 100, 1.0);
    mapView.frame = CGRectMake(448*kScreenWidth/1334, 360*kScreenHeight/750, 442*kScreenWidth/1334, kScreenHeight*390/750);
    [self.view addSubview:mapView];
    
    // 区域派出所民警
    CN3WMOrderAnalysis *orderAnalysisView = [[CN3WMOrderAnalysis alloc] initWithFrame:CGRectMake(892*kScreenWidth/1334, 22*kScreenHeight/750, 448*kScreenWidth/1334, 204*kScreenHeight/750)];
    orderAnalysisView.backgroundColor = RGBA(47, 59, 100, 1.0);
    [self.view addSubview:orderAnalysisView];
    
    // 企业属性分布
    CN3WMOnlineTrading *onlineTradingView = [[CN3WMOnlineTrading alloc] initWithFrame:CGRectMake(892*kScreenWidth/1334, 228*kScreenHeight/750, 448*kScreenWidth/1334, 194*kScreenHeight/750)];
    onlineTradingView.backgroundColor = RGBA(47, 59, 100, 1.0);
    [self.view addSubview:onlineTradingView];
    
    CN3WMInternational *internationalView = [[CN3WMInternational alloc] initWithFrame:CGRectMake(892*kScreenWidth/1334, 424*kScreenHeight/750, 448*kScreenWidth/1334, 156*kScreenHeight/750)];
    internationalView.backgroundColor = RGBA(47, 59, 100, 1.0);
    [self.view addSubview:internationalView];
    
    CN3WMServeAcount *serveAcountView = [[CN3WMServeAcount alloc] initWithFrame:CGRectMake(892*kScreenWidth/1334, 582*kScreenHeight/750, 448*kScreenWidth/1334, 168*kScreenHeight/750)];
    serveAcountView.backgroundColor = RGBA(47, 59, 100, 1.0);
    [self.view addSubview:serveAcountView];
    
}


- (void)btnAction:(UIButton *)btn
{
    WeatherView *view = [WeatherView defaultWeatherView];
    view.parentVC = self;
    [self lew_presentPopupView:view animation:[LewPopupViewAnimationFade new] dismissed:^{
        NSLog(@"动画结束");
    }];
}

- (void)btnclickUser:(UIButton *)btn
{
    CN3WMUser *view = [CN3WMUser defaultUserView];
    view.parentVC = self;
    [self lew_presentPopupView:view animation:[LewPopupViewAnimationFade new] dismissed:^{
        NSLog(@"动画结束");
    }];
}


- (void)userAnalysisAction:(UIButton *)btn
{
//    UserAnalysisViewController *vc = [[UserAnalysisViewController alloc] init];
//    vc.view.frame = CGRectMake(100, 100, kScreenWidth-100, kScreenHeight-100);
//    [self presentViewController:vc animated:NO completion:nil];
    
    AlertHYFB *view = [AlertHYFB defaultAlertView];
    view.parentView = self;
    [self lew_presentPopupView:view animation:[LewPopupViewAnimationFade new] dismissed:^{
        NSLog(@"动画结束");
    }];
    
}

- (void)webSiteViewAction:(UIButton *)btn
{
    CN3WMWebsite *view = [CN3WMWebsite defaultWebSiteView];
    view.parentView = self;
    [self lew_presentPopupView:view animation:[LewPopupViewAnimationFade new] dismissed:^{
        NSLog(@"动画结束");
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
