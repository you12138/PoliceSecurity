//
//  policeBase.m
//  DataAnalysisPlatform
//
//  Created by 王化楠 on 2017/1/16.
//  Copyright © 2017年 whn. All rights reserved.
//

#import "policeBase.h"

@implementation policeBase


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        _lineLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lineLabel];
        
        self.orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lineLabel.frame)+1, self.frame.size.height-3, self.frame.size.height-3)];
        _orderLabel.backgroundColor = RGBA(45, 254, 254, 1.0);
        _orderLabel.font = [UIFont systemFontOfSize:7.0];
        _orderLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.orderLabel];
        
        self.policeName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_orderLabel.frame), CGRectGetMaxY(_lineLabel.frame)+1, (self.frame.size.width - self.orderLabel.frame.size.width)/3, self.frame.size.height-3)];
        _policeName.textAlignment = NSTextAlignmentCenter;
        _policeName.textColor = [UIColor whiteColor];
        _policeName.font = [UIFont systemFontOfSize:7.0];
        [self addSubview:_policeName];
        
        self.netNum = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_policeName.frame), CGRectGetMaxY(_lineLabel.frame)+1, (self.frame.size.width - self.orderLabel.frame.size.width)/3, self.frame.size.height-3)];
        _netNum.textAlignment = NSTextAlignmentCenter;
        _netNum.textColor = [UIColor whiteColor];
        _netNum.font = [UIFont systemFontOfSize:7.0];
        [self addSubview:_netNum];
        
        self.personCount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_netNum.frame), CGRectGetMaxY(_lineLabel.frame)+1, (self.frame.size.width - self.orderLabel.frame.size.width)/3, self.frame.size.height-3)];
        _personCount.textAlignment = NSTextAlignmentCenter;
        _personCount.textColor = [UIColor whiteColor];
        _personCount.font = [UIFont systemFontOfSize:7.0];
        [self addSubview:_personCount];
        
    }
    return self;
}


@end
