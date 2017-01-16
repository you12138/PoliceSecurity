//
//  NewsBaseView.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/18.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "NewsBaseView.h"
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface NewsBaseView ()

@property (nonatomic, strong) UILabel *lineLabel;

@end

@implementation NewsBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor greenColor];
        [self addSubview:self.websiteLabel];
        [self addSubview:self.reportNumLabel];
        [self addSubview:self.pageViewLabel];
        [self addSubview:self.lineLabel];
    }
    return self;
}

- (UILabel *)websiteLabel
{
    if (!_websiteLabel) {
        self.websiteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH/3, HEIGHT-3)];
        _websiteLabel.backgroundColor = [UIColor redColor];
        _websiteLabel.font = [UIFont systemFontOfSize:7.0];
        _websiteLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _websiteLabel;
}

- (UILabel *)reportNumLabel
{
    if (!_reportNumLabel) {
        self.reportNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.websiteLabel.frame), 0, WIDTH/3, HEIGHT-3)];
        _reportNumLabel.backgroundColor = [UIColor yellowColor];
        _reportNumLabel.font = [UIFont systemFontOfSize:7.0];
        _reportNumLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _reportNumLabel;
}

- (UILabel *)pageViewLabel
{
    if (!_pageViewLabel) {
        self.pageViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.reportNumLabel.frame), 0, WIDTH/3, HEIGHT-3)];
        _pageViewLabel.backgroundColor = [UIColor blueColor];
        _pageViewLabel.font = [UIFont systemFontOfSize:7.0];
        _pageViewLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _pageViewLabel;
}

- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, HEIGHT-2, WIDTH-10, 1)];
        self.lineLabel.backgroundColor = [UIColor blackColor];
    }
    return _lineLabel;
}

@end
