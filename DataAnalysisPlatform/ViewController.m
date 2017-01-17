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
#import "Masonry.h"

#import "AlertHYFB.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) JHPieChart *pie;
@property (nonatomic, strong) JHRingChart *ring;
@property (nonatomic, strong) JHColumnChart *column;
@property (nonatomic, strong) KKColumnChart *kkColumn;

@end

@implementation ViewController

- (UIView *)animationView
{
    if (!_animationView) {
        self.animationView = [[UIView alloc] initWithFrame:self.view.frame];
    }
    return _animationView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = RGBA(2, 12, 49, 1.0);
    
    if ([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
        [self loadMyView];
    }else {
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [btn setTitle:@"Click Me" forState:(UIControlStateNormal)];
        btn.backgroundColor = [UIColor orangeColor];
        btn.center = self.view.center;
        [self.view addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.offset(100);
            make.height.offset(100);
        }];
        
        btn.tag = 1000000;
        [btn addTarget:self action:@selector(iPadAction) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    
}

- (void)iPadAction
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"TIPS" message:@"This is an iPhone application, please open to get a better experience in the iPhone" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Go"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self loadMyView];
        UIButton *btn = [(UIButton *)self.view viewWithTag:1000000];
        [btn removeFromSuperview];
    }];
    
    [alert addAction:cancelAction];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:^{
    }];
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
    [self.view addSubview:weatherView];
    [self.view addSubview:clickBtn];
    
    // 禾山派出所常住人口
    CN3WMUser *userView = [[NSBundle mainBundle] loadNibNamed:@"CN3WMUser" owner:nil options:nil].firstObject;
    userView.frame = CGRectMake(0, 108*2*kScreenHeight/750, 107*2*kScreenWidth/1334, 89*2*kScreenHeight/750);
    userView.backgroundColor = RGBA(47, 59, 100, 1.0);
    UIButton *clickUser = [UIButton buttonWithType:(UIButtonTypeSystem)];
    clickUser.frame = CGRectMake(0, 108*2*kScreenHeight/750, 107*2*kScreenWidth/1334, 89*2*kScreenHeight/750);
//    [clickUser addTarget:self action:@selector(btnclickUser:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:userView];
    [self.view addSubview:clickUser];
    
    
    // 人口分析
    CN3WMIndustrial *industrialView = [[CN3WMIndustrial alloc] initWithFrame:CGRectMake(0, 197.8*2*kScreenHeight/750, 223*2*kScreenWidth/1334, 83*2*kScreenHeight/750)];
    industrialView.backgroundColor = RGBA(47, 59, 100, 1.0);
    UIButton *industrialBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    industrialBtn.frame = CGRectMake(0, 197.8*2*kScreenHeight/750, 223*2*kScreenWidth/1334, 83*2*kScreenHeight/750);
    [industrialBtn addTarget:self action:@selector(industrialBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:industrialView];
    [self.view addSubview:industrialBtn];
    
    // 人口分布
    CN3WMUserAnalysis *UserAnalysisView = [[CN3WMUserAnalysis alloc] initWithFrame:CGRectMake(108*2*kScreenWidth/1334, 11*2*kScreenHeight/750, 115*2*kScreenWidth/1334, 186*2*kScreenHeight/750)];
    UserAnalysisView.backgroundColor = RGBA(47, 59, 100, 1.0);
    
    UIButton *userAnalysisBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    userAnalysisBtn.frame = CGRectMake(108*2*kScreenWidth/1334, 11*2*kScreenHeight/750, 115*2*kScreenWidth/1334, 186*2*kScreenHeight/750);
//    [userAnalysisBtn addTarget:self action:@selector(userAnalysisAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:UserAnalysisView];
    [self.view addSubview:userAnalysisBtn];
    
    // 区域人员身份统计
    CN3WMNews *newsView = [[CN3WMNews alloc] initWithFrame:CGRectMake(0, 282*2*kScreenHeight/750, 223*2*kScreenWidth/1334, 93*2*kScreenHeight/750)];
    newsView.backgroundColor = RGBA(47, 59, 100, 1.0);
    UIButton *newsViewBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    newsViewBtn.frame = CGRectMake(0, 282*2*kScreenHeight/750, 223*2*kScreenWidth/1334, 93*2*kScreenHeight/750);
    [newsViewBtn addTarget:self action:@selector(newsViewBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:newsView];
    [self.view addSubview:newsViewBtn];
    
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
    
    // 房屋类型
    CN3WMInternational *internationalView = [[CN3WMInternational alloc] initWithFrame:CGRectMake(892*kScreenWidth/1334, 424*kScreenHeight/750, 448*kScreenWidth/1334, 156*kScreenHeight/750)];
    internationalView.backgroundColor = RGBA(47, 59, 100, 1.0);
    
    UIButton *InternationalBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    InternationalBtn.frame = CGRectMake(892*kScreenWidth/1334, 424*kScreenHeight/750, 448*kScreenWidth/1334, 156*kScreenHeight/750);
    [InternationalBtn addTarget:self action:@selector(InternationalBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:internationalView];
    [self.view addSubview:InternationalBtn];
    
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


/**
 * 人口分析动画
 */
- (void)industrialBtnAction:(UIButton *)sender
{
    
    [self.view addSubview:self.animationView];
    self.animationView.backgroundColor = RGBA(2, 12, 49, 1.0);
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(kScreenWidth - 80*kScreenWidth/1334, 30*kScreenHeight/750, 50*kScreenWidth/1334, 50*kScreenHeight/750);
    [btn setImage:[UIImage imageNamed:@"delete"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(animationViewDismiss:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.ring = [[JHRingChart alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, kScreenHeight)];
    _ring.backgroundColor = [UIColor clearColor];
    NSArray *arr = @[@{@"key":@"0~20", @"value":@"50"}, @{@"key":@"20~30", @"value":@"40"}, @{@"key":@"30~40", @"value":@"30"}, @{@"key":@"40~50", @"value":@"30"}, @{@"key":@"50~60", @"value":@"15"}, @{@"key":@"60以上", @"value":@"10"}];
    NSMutableArray *arrValue = [NSMutableArray array];
    NSMutableArray *arrTitle = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        NSString *title = dic[@"key"];
        NSString *value = dic[@"value"];
        [arrTitle addObject:title];
        [arrValue addObject:value];
    }
    _ring.ringWidth = 30;
    _ring.valueDataArr = [NSArray arrayWithArray:arrValue];
    _ring.titleDataArr = [NSArray arrayWithArray:arrTitle];
    
    self.pie = [[JHPieChart alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_ring.frame), 0, kScreenWidth*1.5/4, kScreenHeight*1.2/2)];
    _pie.backgroundColor = [UIColor clearColor];
    CGPoint center = CGPointMake(kScreenWidth*3/4, kScreenHeight/2);
    _pie.center = center;
    _pie.valueArr = @[@301457, @567411];
    _pie.descArr = @[@"男", @"女"];
    _pie.positionChangeLengthWhenClick = 10;
//  我在内部注释掉了这个属性
//    _pie.showDescripotion = NO;
    
    [_ring showAnimation];
    [_pie showAnimation];
    [self.animationView addSubview:_pie];
    [self.animationView addSubview:_ring];
    [self.animationView addSubview:btn];
    
}

/**
 * 区域人员身份统计动画
 */
- (void)newsViewBtnAction:(UIButton *)sender
{
    [self.view addSubview:self.animationView];
    self.animationView.backgroundColor = RGBA(2, 12, 49, 1.0);
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(kScreenWidth - 80*kScreenWidth/1334, 30*kScreenHeight/750, 50*kScreenWidth/1334, 50*kScreenHeight/750);
    [btn setImage:[UIImage imageNamed:@"delete"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(animationViewDismiss:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.column = [[JHColumnChart alloc] initWithFrame:CGRectMake(0, 50*kScreenHeight/750, kScreenWidth, kScreenHeight-50*kScreenHeight/750)];
    _column.valueArr = @[@[@4000],
                         @[@500],
                         @[@800],
                         @[@200],
                         @[@200],
                         @[@800],
                         @[@500],
                         @[@3000]];
    _column.xShowInfoText = @[@"党团员", @"政协人大", @"军烈家属", @"境外", @"残疾人", @"失业", @"独居老人", @"其他"];
    _column.originSize = CGPointMake(30, 30);
    _column.typeSpace = 30;
//    _column.bgVewBackgoundColor = [UIColor blackColor];
    _column.drawFromOriginX = 10;
    _column.columnWidth = 40;
    _column.drawTextColorForX_Y = [UIColor greenColor];
    _column.colorForXYLine = [UIColor greenColor];
    _column.columnBGcolorsArr = @[RGBA(254, 234, 149, 1.0)];
    [_column showAnimation];
    
    [self.animationView addSubview:_column];
    [self.animationView addSubview:btn];
    
}

/**
 * 房屋类型动画
 */
- (void)InternationalBtnAction:(UIButton *)sender
{
    [self.view addSubview:self.animationView];
    self.animationView.backgroundColor = RGBA(2, 12, 49, 1.0);
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(kScreenWidth - 80*kScreenWidth/1334, 30*kScreenHeight/750, 50*kScreenWidth/1334, 50*kScreenHeight/750);
    [btn setImage:[UIImage imageNamed:@"delete"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(animationViewDismiss:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.kkColumn = [[KKColumnChart alloc] initWithFrame:CGRectMake(0, 50*kScreenHeight/750, kScreenWidth, kScreenHeight-50*kScreenHeight/750)];
    _kkColumn.valueArr = @[
                         @[@214],
                         @[@265],
                         @[@316]
                           ];
    _kkColumn.xShowInfoText = @[@"出租房", @"自住房", @"单位用房"];
    _kkColumn.originSize = CGPointMake(50, 50);
    _kkColumn.typeSpace = 120*kScreenHeight/750;
    _kkColumn.drawFromOriginX = 10;
    _kkColumn.columnWidth = 10;
    _kkColumn.drawTextColorForX_Y = [UIColor greenColor];
    _kkColumn.colorForXYLine = [UIColor greenColor];
    _kkColumn.columnBGcolorsArr = @[RGBA(254, 234, 149, 1.0)];
    [_kkColumn showAnimation];
    
    [self.animationView addSubview:_kkColumn];
    [self.animationView addSubview:btn];
}

/**
 * 动画消失
 */
- (void)animationViewDismiss:(UIButton *)sender
{
    [_kkColumn removeFromSuperview];
    [_column removeFromSuperview];
    [_pie removeFromSuperview];
    [_ring removeFromSuperview];
    [self.animationView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
