//
//  CollectionViewCell.h
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/17.
//  Copyright © 2016年 whn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *qr_codeImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
