//
//  AlertHYFB.m
//  DataAnalysisPlatform
//
//  Created by whn on 2016/11/16.
//  Copyright © 2016年 whn. All rights reserved.
//

#import "AlertHYFB.h"
#import "Public.h"
#import "HYFBTableViewCell.h"
#import "CollectionViewCell.h"
#import "HYFBModel.h"
#import "HYFBModel2.h"
#import "NetWorkSingleton.h"
#import "UIImageView+WebCache.h"

#import "UIViewController+LewPopupViewController.h"
#import "LewPopupViewAnimationFade.h"

@interface AlertHYFB ()<UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UICollectionView *myCollectionView;

@property (nonatomic, strong) NSMutableArray *categoryDataSouce;
@property (nonatomic, strong) NSMutableArray *DetailDataSource;

@property (nonatomic, strong) NSIndexPath *lastTypeIndexPath;

@end

@implementation AlertHYFB

- (NSMutableArray *)categoryDataSouce
{
    if (!_categoryDataSouce) {
        self.categoryDataSouce = [NSMutableArray array];
    }
    return _categoryDataSouce;
}

- (NSMutableArray *)DetailDataSource
{
    if (!_DetailDataSource) {
        self.DetailDataSource = [NSMutableArray array];
    }
    return _DetailDataSource;
}

+ (instancetype)defaultAlertView
{
    return [[AlertHYFB alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _alertHYFBView = [UIView new];
        _alertHYFBView.frame = frame;
        self.backgroundColor = RGBA(47, 59, 100, 1.0);
        
        UILabel *label = [[UILabel alloc ]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        label.backgroundColor = RGBA(8, 38, 208, 1.0);
        label.userInteractionEnabled = YES;
        label.text = @"三维码大数据分析云平台";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:20.0];
        [self addSubview:label];
        
        UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
//        backBtn.backgroundColor = [UIColor orangeColor];
        [backBtn addTarget:self action:@selector(backAction:) forControlEvents:(UIControlEventTouchUpInside)];
        backBtn.frame = CGRectMake(5, 0, 40, 40);
        [backBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
        
        [self loadCategoryData];
        
        
        [self loadTableView];
        [self CreatRightCollctionView];
        
        [self addSubview:_alertHYFBView];
        // 如果加载上面会被覆盖
        [self addSubview:backBtn];

        

    }
    
    return self;
    
}

/**
 * 返回事件
 */
- (void)backAction:(UIButton *)sender
{
    [_parentView lew_dismissPopupView];
}


/**
 * 请求左侧分类栏数据
 */
- (void)loadCategoryData{
    
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:HYFBURL showHUD:YES successBlock:^(id responseBody) {
        if (responseBody) {
            
            /**
             * 回到主线程刷新UI
             */
            dispatch_async(dispatch_get_main_queue(), ^{
//                NSString *numcount = responseBody[@"qr_code_count"];
//                [self.categoryDataSouce addObject:numcount];
                NSArray *array = responseBody[@"data"];
                for (NSDictionary *dic in array) {
                    HYFBModel *model = [[HYFBModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.categoryDataSouce addObject:model];
                }
                [self.myTableView reloadData];
            });
            // 请求成功进行第二次请求，如果同步请求 会导致菊花不消失
            [self loadDetailData];
        }
        
    } failureBlock:nil];
    
}
/**
 * 请求右侧详情栏数据
 */
- (void)loadDetailData{
    [[NetWorkSingleton shareManager] getResultWithParameter:nil url:HYFBURL2 showHUD:YES successBlock:^(id responseBody) {
        if (responseBody) {
//            NSLog(@"%@", responseBody);
            /**
             * 回到主线程刷新UI
             */
            dispatch_async(dispatch_get_main_queue(), ^{
                NSArray *arr = responseBody[@"data"];
                for (NSDictionary *dic in arr) {
                    HYFBModel2 *model = [[HYFBModel2 alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.DetailDataSource addObject:model];
                }
                
                [self.myCollectionView reloadData];
            });
        }
    } failureBlock:nil];
}

/**
 * 加载左侧分类栏
 */
- (void)loadTableView
{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 150, self.frame.size.height-40) style:(UITableViewStylePlain)];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.backgroundColor = RGBA(47, 59, 100, 1.0);;
    [_alertHYFBView addSubview:_myTableView];
    
    self.lastTypeIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
}

/**
 * 加载右侧详情栏
 */
- (void)CreatRightCollctionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 5.0f;
    flowLayout.minimumInteritemSpacing = 5.0f;
    
    _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(150, 42, self.frame.size.width-150, self.frame.size.height-42) collectionViewLayout:flowLayout];
    
    [_myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    
    [_myCollectionView setBackgroundColor:RGBA(47, 59, 100, 1.0)];
    
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    
    [_alertHYFBView addSubview:_myCollectionView];
    
}

/**
 * tableView D代理
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoryDataSouce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    HYFBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *arrayCell = [[NSBundle mainBundle] loadNibNamed:@"HYFBTableViewCell" owner:self options:nil];
        cell = arrayCell[0];
    }
    cell.backgroundColor = RGBA(47, 59, 100, 1.0);
    
    HYFBModel *model = self.categoryDataSouce[indexPath.row];
    cell.categoryLabel.text = model.industry;
    cell.numberLabel.text = model.number;
    
    cell.typeSelected = (indexPath.row == self.lastTypeIndexPath.row) ? YES : NO;
//    if (indexPath.row == self.lastTypeIndexPath.row) {
//        
//    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld", indexPath.row);
    
    HYFBTableViewCell *thisCell = [tableView cellForRowAtIndexPath:indexPath];
    HYFBTableViewCell *lastCell = [tableView cellForRowAtIndexPath:self.lastTypeIndexPath];
    if (!(indexPath.row == self.lastTypeIndexPath.row)) {
        thisCell.typeSelected = YES;
        lastCell.typeSelected = NO;
        self.lastTypeIndexPath = indexPath;
    }
    
    
    
}

/**
 * collectionView 代理
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.DetailDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    HYFBModel2 *model = self.DetailDataSource[indexPath.item];
    
    cell.nameLabel.text = model.title;
    [cell.qr_codeImg sd_setImageWithURL:[NSURL URLWithString:model.qr_code]];
    cell.backgroundColor = RGBA(47, 59, 100, 1.0);
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 5, 0, 5);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(93, 123);
    
    
}

/*
- (void)didAddSubview:(UIView *)subview
{
    // 设置左边tableview默认选中第一行
 
    [self.myTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:(UITableViewScrollPositionTop)];
    // 实现第一行点击所调用的方法
    [self tableView:self.myTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}
*/

@end
