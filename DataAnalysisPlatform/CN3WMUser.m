//
//  CN3WMUser.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMUser.h"
#import "Public.h"
#import "NetWorkSingleton.h"
#import "UIViewController+LewPopupViewController.h"
#import "LewPopupViewAnimationFade.h"

@interface CN3WMUser ()
/**
 * xib
 */
@property (strong, nonatomic)  UIImageView *bg_img;// 背景图
@property (strong, nonatomic)  UILabel *areaWeatherLabel;// 地区
@property (strong, nonatomic)  UILabel *XIBNumLabel;




/**
* 放大后的视图
*/
@property (nonatomic, strong) UIImageView *bgimg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) UIImageView *numBgImg;
@property (nonatomic, strong) UILabel *numLabel;

@property (nonatomic, strong) NSString *numStr;

@end



@implementation CN3WMUser

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self loadXibUI];
    [self loadXibData];
}


- (void)loadXibUI
{
    self.bg_img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_bg"]];
//    _bg_img.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_bg_img];
    _bg_img.frame = CGRectMake(0, -5*kScreenHeight/750, 180*kScreenWidth/1334, 40*kScreenHeight/750);
    
    self.areaWeatherLabel = [[UILabel alloc] init];
    _areaWeatherLabel.text = @"禾山派出所常住人口";
    _areaWeatherLabel.textAlignment = NSTextAlignmentCenter;
    _areaWeatherLabel.font = [UIFont systemFontOfSize:7.0];
    _areaWeatherLabel.textColor = [UIColor whiteColor];
    [self addSubview:_areaWeatherLabel];
    _areaWeatherLabel.frame = CGRectMake(0, 0, 180*kScreenWidth/1334, 30*kScreenHeight/750);
    
    UIImageView *iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_jx"]];
    [self addSubview:iconImage];
    iconImage.frame = CGRectMake(12*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame)+20*kScreenHeight/750, 30*kScreenWidth/1334, 30*kScreenHeight/750);
    
    UILabel *iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImage.frame)+3*kScreenWidth/1334, CGRectGetMaxY(_areaWeatherLabel.frame)+20*kScreenHeight/750, 70*kScreenWidth/1334, 30*kScreenHeight/750)];
    iconLabel.textColor = [UIColor whiteColor];
    iconLabel.textAlignment = NSTextAlignmentLeft;
    iconLabel.text = @"(万/人)";
    iconLabel.font = [UIFont systemFontOfSize:7.0];
    [self addSubview:iconLabel];
    
    for (int i = 0; i < 5; i++) {
        UIImageView *bgImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"使用用户"]];
        bgImg.frame = CGRectMake(18*kScreenWidth/1334+i*36*kScreenWidth/1334, CGRectGetMaxY(iconLabel.frame)+15*kScreenHeight/750, 36*kScreenWidth/1334, 60*kScreenHeight/750);
        [self addSubview:bgImg];
        
        UILabel *numText = [[UILabel alloc] initWithFrame:CGRectMake(18*kScreenWidth/1334+i*36*kScreenWidth/1334, CGRectGetMaxY(iconLabel.frame)+15*kScreenHeight/750, 36*kScreenWidth/1334, 60*kScreenHeight/750)];
        numText.tag = 1001+i;
        numText.text = @"0";
        numText.textAlignment = NSTextAlignmentCenter;
        numText.textColor = [UIColor whiteColor];
        numText.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:numText];
        
    }
}


/**
 * 创建放大视图
 */
+ (instancetype)defaultUserView
{
    return [[CN3WMUser alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _userView = [UIView new];
        _userView.frame = frame;
        _userView.backgroundColor = RGBA(47, 59, 100, 1.0);
        [self loadDetailView];
        [self addSubview:_userView];
    }
    return self;
}

- (void)loadDetailView
{
    [self loadData];
    
    
    _bgimg = [[UIImageView alloc] init];
    _bgimg.image = [UIImage imageNamed:@"title_bg.png"];
    _bgimg.frame = CGRectMake(0, -6, kScreenWidth*300/1334, kScreenHeight*65/750);
    [_userView addSubview:_bgimg];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(-6, 0, kScreenWidth*300/1334, kScreenHeight*40/750);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = @"禾山派出所常住人口";
    [_userView addSubview:_titleLabel];
    
    _iconImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    _iconImg.frame = CGRectMake(20*kScreenWidth/1334, CGRectGetMaxY(_bgimg.frame)+30*3*kScreenHeight/750, 38*3*kScreenWidth/1334, 28*3*kScreenWidth/1334);
    [_userView addSubview:_iconImg];
    
    _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_iconImg.frame) + 25*kScreenWidth/1334, CGRectGetMinY(_iconImg.frame), 130*3*kScreenWidth/1334, 28*3*kScreenHeight/750)];
    _userLabel.text = @"(万/人)";
    _userLabel.textAlignment = NSTextAlignmentLeft;
//    _userLabel.font = [UIFont systemFontOfSize:<#(CGFloat)#>]
    _userLabel.textColor = [UIColor whiteColor];
    [_userView addSubview:_userLabel];
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    backBtn.backgroundColor = [UIColor orangeColor];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:(UIControlEventTouchUpInside)];
    backBtn.frame = CGRectMake(0, 0, 50, 50);
    backBtn.center = _userView.center;
    [_userView addSubview:backBtn];
}

/**
 * 返回事件
 */
- (void)backAction:(UIButton *)sender
{
    [_parentVC lew_dismissPopupView];
}

/**
 * 数据请求
 */
- (void)loadData
{
    NSString *url = USERURL;
    
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:url showHUD:YES successBlock:^(id responseBody) {
        if (responseBody) {
            NSString *str = responseBody[@"number"];
            
            self.numStr = [NSString stringWithString:str];
            
            
            for (int i = 0; i < 5; i++) {
                NSString *num = [self.numStr substringWithRange:NSMakeRange(i, 1)];
                
                _numBgImg = [[UIImageView alloc] initWithFrame:CGRectMake(44*kScreenWidth/1334 + i*114*kScreenWidth/1334, CGRectGetMaxY(_iconImg.frame) + 20*kScreenHeight/750, 108*kScreenWidth/1334, 210*kScreenHeight/750)];
                _numBgImg.image = [UIImage imageNamed:@"使用用户"];
                [_userView addSubview:_numBgImg];
                
                
                _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(44*kScreenWidth/1334 + i*114*kScreenWidth/1334, CGRectGetMaxY(_iconImg.frame) + 20*kScreenHeight/750, 108*kScreenWidth/1334, 210*kScreenHeight/750)];
                _numLabel.text = num;
                _numLabel.textAlignment = NSTextAlignmentCenter;
                _numLabel.font = [UIFont systemFontOfSize:50.0];
                _numLabel.textColor = [UIColor whiteColor];
                [_userView addSubview:_numLabel];
            } 
        }
    
        
    } failureBlock:nil];
}

- (void)loadXibData
{
    NSString *url = USERURL;
    
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:url showHUD:YES successBlock:^(id responseBody) {
        if (responseBody) {
            NSString *str = responseBody[@"number"];
            
            self.numStr = [NSString stringWithString:str];
            
            
            for (int i = 0; i < 5; i++) {
                NSString *num = [self.numStr substringWithRange:NSMakeRange(i, 1)];
                UILabel *label = (UILabel *)[self viewWithTag:1001+i];
                label.text = num;
                
            }

        }
        
    } failureBlock:nil];
    
    
    
}


@end
