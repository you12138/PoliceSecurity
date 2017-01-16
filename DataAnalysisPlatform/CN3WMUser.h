//
//  CN3WMUser.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/11.
//  Copyright © 2016年 whn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CN3WMUser : UIView



/**
 * 创建一个新的视图层用来展示放大后的模块
 */
@property (nonatomic, strong) UIView *userView;

@property (nonatomic, weak) UIViewController *parentVC;
/**
 * 重写放大后的视图的创建方法
 */
+ (instancetype)defaultUserView;

@end
