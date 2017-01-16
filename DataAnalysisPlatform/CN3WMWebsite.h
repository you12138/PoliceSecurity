//
//  CN3WMWebsite.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CN3WMWebsite : UIView


/**
 * 创建一个新的视图层用来显示放大后的视图
 */
@property (nonatomic, strong) UIView *webSiteView;
@property (nonatomic, strong) UIViewController *parentView;

/**
 * 重写放大后的视图的创建放法
 */
+ (CN3WMWebsite *)defaultWebSiteView;


@end
