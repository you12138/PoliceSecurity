//
//  JHColumnChart.h
//  JHChartDemo
//
//  Created by cjatech-简豪 on 16/5/10.
//  Copyright © 2016年 JH. All rights reserved.
//

#import "JHChart.h"

@interface JHColumnChart : JHChart


/**
 *  Each histogram of the background color, if you do not set the default value for green. Setup must ensure that the number and type of the data source array are the same, otherwise the default is not set.
 *  每个直方图的背景颜色， 默认为绿色。设置时必须保证数据源的数量和类型数组的数量相同，否则认为没有设置
 */
@property (nonatomic, strong) NSArray<NSArray *> * columnBGcolorsArr;

/**
 *  Data source array
 */
@property (nonatomic, strong) NSArray<NSArray *> * valueArr;

/**
 *  X axis classification of each icon
 *  X 提示语
 */
@property (nonatomic, strong) NSArray * xShowInfoText;


/**
 *  The background color of the content view
 *  背景颜色
 */
@property (nonatomic, strong) UIColor  * bgVewBackgoundColor;


/**
 *  Column spacing, non continuous, default is 5
 *  列间距，非连续的，默认是5
 */
@property (nonatomic, assign) CGFloat typeSpace;

/**
 *  The width of the column, the default is 40
 *  列的宽度， 默认是40
 */
@property (nonatomic, assign) CGFloat columnWidth;

/**
 *  Whether the need for Y, X axis, the default YES
 *  是否需要XY轴，默认是YES
 */
@property (nonatomic, assign) BOOL needXandYLine;

/**
 *  Y, X axis line color
 *  XY轴线的颜色
 */
@property (nonatomic, strong) UIColor * colorForXYLine;

/**
 *  X, Y axis text description color
 *  XY轴文本描述颜色
 */
@property (nonatomic, strong) UIColor * drawTextColorForX_Y;

/**
 *  Dotted line guide color
 *  虚线的颜色
 */
@property (nonatomic, strong) UIColor * dashColor;

/**
 *  The starting point, can be understood as the origin of the left and bottom margins
 *  直方图的起点，左边和底部边缘的起点
 */
@property (nonatomic, assign) CGPoint originSize;

/**
 *  Starting from the origin of the horizontal distance histogram
 *  水平距离 直方图的起点
 */
@property (nonatomic, assign) CGFloat drawFromOriginX;

/**
 *  Whether this chart show Y line or not .Default is Yes
 *  是否显示Y轴，默认为YES
 */
@property (nonatomic,assign) BOOL isShowYLine;

/**
 *  Whether this chart show line or not.Default is NO;
 *  是否在图表中显示行， 默认为NO
 */
@property (nonatomic,assign) BOOL isShowLineChart;


/**
 *  If isShowLineChart proprety is YES,we need this value array to draw chart
 *  如果 isShowLineChart 为YES，需要为为其绘制图表
 */
@property (nonatomic,strong)NSArray * lineValueArray;


/**
 *  If isShowLineChart proprety is Yes,we will draw path of this linechart with this color
 *  Default is blue
 *  如果 isShowLineChart 为YES， 设置颜色
 *  默认是蓝色
 */
@property (nonatomic,strong)UIColor * lineChartPathColor;

/**
 *  if isShowLineChart proprety is Yes,we will draw this linechart valuepoint with this color
 *  Default is yellow
 */
@property (nonatomic,strong)UIColor * lineChartValuePointColor;


@end
