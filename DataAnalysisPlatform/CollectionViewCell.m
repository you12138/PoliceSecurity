//
//  CollectionViewCell.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/17.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrcell = [[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell" owner:self options:nil];
        if (arrcell.count<1) {
            return nil;
        }
        if (![[arrcell objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [arrcell objectAtIndex:0];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
