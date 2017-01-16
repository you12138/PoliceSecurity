//
//  PersonBase.m
//  DataAnalysisPlatform
//
//  Created by 王化楠 on 2017/1/16.
//  Copyright © 2017年 whn. All rights reserved.
//

#import "PersonBase.h"

@implementation PersonBase

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.bg_img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        _bg_img.contentMode = UIViewContentModeCenter;
        self.bg_img.image = [UIImage imageNamed:@"行业应用分布"];
        [self addSubview:self.bg_img];
        
        self.areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(18*kScreenWidth/1334, 0, self.frame.size.width/2, self.frame.size.height)];
        _areaLabel.textColor = [UIColor whiteColor];
        _areaLabel.textAlignment = NSTextAlignmentCenter;
        _areaLabel.text = @"坂上社区:";
        _areaLabel.font = [UIFont systemFontOfSize:10.0];
        [self addSubview:self.areaLabel];
        
        self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_areaLabel.frame)-10*kScreenWidth/1334, 0, self.frame.size.width/2-30*kScreenWidth/1334, self.frame.size.height)];
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.text = @"52";
        _numLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:_numLabel];
        
        self.tThousand = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_numLabel.frame)-20*kScreenWidth/1334, 0, 20*kScreenWidth/1334, self.frame.size.height)];
        _tThousand.textColor = [UIColor whiteColor];
        _tThousand.textAlignment = NSTextAlignmentCenter;
        _tThousand.text = @"万";
        _tThousand.font = [UIFont systemFontOfSize:7.0];
        [self addSubview:_tThousand];
        
    }
    return self;
}

@end
