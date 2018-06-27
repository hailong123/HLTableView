//
//  HLBaseTableViewController.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HLCellDataAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLBaseTableViewController : UIViewController
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@property (nonatomic, assign) NSInteger pageNo;

@property (nonatomic, strong) NSMutableArray <HLCellDataAdapter *> *adapters;

@property (nonatomic, assign, getter=isFooterRefresh)  BOOL footerRefresh;

- (void)refreshData;

- (void)loadMoreData;

- (void)stopRefresh;

@end

NS_ASSUME_NONNULL_END
