//
//  CN3WMWebsite.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CN3WMWebsite.h"
#import "NetWorkSingleton.h"
#import "Public.h"

@interface CN3WMWebsite ()

/**
 * 放大的视图
 */
@property (nonatomic, strong) UIImageView *bgimg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *numBgImg;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation CN3WMWebsite

/**
 * xib视图
 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self loadXibData];
}

/**
 * 放大后视图
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _webSiteView = [UIView new];
        _webSiteView.frame = frame;
        _webSiteView.backgroundColor = RGBA(47, 59, 100, 1.0);
        [self loadDetailView];
        [self addSubview:_webSiteView];
    }
    return self;
}

+ (CN3WMWebsite *)defaultWebSiteView
{
    return [[CN3WMWebsite alloc] initWithFrame:CGRectMake(0, 0, 224*3*kScreenWidth/1334, 182*3*kScreenHeight/750)];
}


- (void)loadDetailView
{
    
    
    _bgimg = [[UIImageView alloc] init];
    _bgimg.image = [UIImage imageNamed:@"title_bg.png"];
    _bgimg.frame = CGRectMake(0, -6, kScreenWidth*300/1334, kScreenHeight*65/750);
    [_webSiteView addSubview:_bgimg];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(-6, 0, kScreenWidth*300/1334, kScreenHeight*40/750);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = @"官网访问量统计";
    [_webSiteView addSubview:_titleLabel];
    
    [self loadDetailData];
    
}


/**
 * 加载数据
 */

- (void)loadXibData
{
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:WEBSITEURL showHUD:YES successBlock:^(id responseBody) {
        if (responseBody) {
            NSArray *arr = responseBody[@"data"];
            for (int i = 0; i<4; i++) {
                UILabel *label = [self viewWithTag:2001+i];
                NSDictionary *dic = arr[i];
                label.text = dic[@"value"];
            }

        }
        
    } failureBlock:^(NSError *error) {
        
    }];
}

/**
 * 加载放大视图数据
 */
- (void)loadDetailData
{
    
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:WEBSITEURL    showHUD:YES successBlock:^(id responseBody) {
        
//        NSLog(@"%@", responseBody);
        if (responseBody) {
            NSArray *arr = responseBody[@"data"];
            
            for (int i = 0; i < 4; i ++) {
                
                NSDictionary *dic = arr[i];
                
                _numBgImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"访问量统计分析.png"]];
                _textLabel = [[UILabel alloc] init];
                _textLabel.textAlignment = NSTextAlignmentCenter;
                _textLabel.textColor = [UIColor whiteColor];
                
                _numLabel = [[UILabel alloc] init];
                _numLabel.textAlignment = NSTextAlignmentCenter;
                _numLabel.textColor = [UIColor whiteColor];
                
                if (i/2==0) {
                    
                    _numBgImg.frame = CGRectMake(12*3*kScreenWidth/1334 + i*106*3*kScreenWidth/1334, CGRectGetMaxY(_bgimg.frame) + 12*2*kScreenHeight/750, 92*3*kScreenWidth/1334, 70*3*kScreenHeight/750);
                    [_webSiteView addSubview:_numBgImg];
                    
                    _textLabel.frame = CGRectMake(12*3*kScreenWidth/1334 + i*106*3*kScreenWidth/1334, CGRectGetMaxY(_bgimg.frame) + 12*5*kScreenHeight/750, 92*3*kScreenWidth/1334, 20*3*kScreenHeight/750);
                    _textLabel.text = dic[@"title"];
                    _numLabel.frame = CGRectMake(12*3*kScreenWidth/1334 + i*106*3*kScreenWidth/1334, CGRectGetMaxY(_textLabel.frame) + 6*kScreenHeight/750, 92*3*kScreenWidth/1334, 25*3*kScreenHeight/750);
                    _numLabel.text = dic[@"value"];
                    
                    [_webSiteView addSubview:_textLabel];
                    [_webSiteView addSubview:_numLabel];
                    
                } else {
                    _numBgImg.frame = CGRectMake(12*3*kScreenWidth/1334 + (i-2)*106*3*kScreenWidth/1334, CGRectGetMaxY(_bgimg.frame) + 80*3*kScreenHeight/750, 92*3*kScreenWidth/1334, 70*3*kScreenHeight/750);
                    [_webSiteView addSubview:_numBgImg];
                    
                    _textLabel.frame = CGRectMake(12*3*kScreenWidth/1334 + (i-2)*106*3*kScreenWidth/1334, CGRectGetMaxY(_bgimg.frame) + 12*5*kScreenHeight/750 + 70*3*kScreenHeight/750, 92*3*kScreenWidth/1334, 20*3*kScreenHeight/750);
                    _textLabel.text = dic[@"title"];
                    _numLabel.frame = CGRectMake(12*3*kScreenWidth/1334 + (i-2)*106*3*kScreenWidth/1334, CGRectGetMaxY(_textLabel.frame) + 6*kScreenHeight/750, 92*3*kScreenWidth/1334, 25*3*kScreenHeight/750);
                    _numLabel.text = dic[@"value"];
                    
                    [_webSiteView addSubview:_textLabel];
                    [_webSiteView addSubview:_numLabel];
                    
                }
            }

        }
            } failureBlock:nil];
}




@end
