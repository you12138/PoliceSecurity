//
//  HYFBTableViewCell.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/17.
//  Copyright © 2016年 whn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYFBTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;

@property (nonatomic, assign) BOOL typeSelected;

@end
