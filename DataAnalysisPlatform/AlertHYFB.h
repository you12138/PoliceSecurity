//
//  AlertHYFB.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/16.
//  Copyright © 2016年 whn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertHYFB : UIView

@property (nonatomic, strong) UIView *alertHYFBView;
@property (nonatomic, weak) UIViewController *parentView;

+ (instancetype)defaultAlertView;

@end
