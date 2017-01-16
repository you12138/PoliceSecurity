//
//  WeatherModel.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/14.
//  Copyright © 2016年 whn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *weather;
@property (nonatomic, strong) NSString *now_tmp;
@property (nonatomic, strong) NSString *day_tmp;
@property (nonatomic, strong) NSString *night_tmp;
@property (nonatomic, strong) NSString *wind;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *week;

@end
