//
//  Public.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#ifndef Public_h
#define Public_h

/**
 * View视图
 */
#import "WeatherView.h"
#import "CN3WMUser.h"
#import "CN3WMIndustrial.h"
#import "CN3WMUserAnalysis.h"
#import "CN3WMNews.h"
#import "CN3WMWebsite.h"
#import "CN3WMTradeView.h"
#import "MapView.h"
#import "CN3WMOrderAnalysis.h"
#import "CN3WMOnlineTrading.h"
#import "CN3WMInternational.h"
#import "CN3WMServeAcount.h"

/**
 * 屏幕宽高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

/**
 * rgba颜色值
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#import "URL.h"

#endif /* Public_h */
