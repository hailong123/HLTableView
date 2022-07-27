//
//  HLBaseTableViewController.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HLCellDataAdapter.h"
#import "HLCellHeaderAndFooterDataAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLBaseTableViewController : UIViewController
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

/*
 设置UITableView的样式
 */

@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/*
 分页参数 默认为 1
 */

@property (nonatomic, assign) NSInteger pageNo;

/*
 组装cell的模型
 */

@property (nonatomic, strong) NSMutableArray <HLCellDataAdapter *> *adapters;


/*
 是否需要头部刷新空间 默认为YES
 */

@property (nonatomic, assign, getter=isHeaderRefresh) BOOL headerRefresh;

/*
 是否需要底部刷新空间 默认为YES
 */

@property (nonatomic, assign, getter=isFooterRefresh)  BOOL footerRefresh;

#pragma mark SubClassOverWriteConfig
//!!!!:以下方法无需调用 super 方法
//重新配置TableViewStyle default UITableViewStyleGrouped
- (void)configTableViewStyle;
//替换默认配置的刷新控件  默认均为 YES
- (void)replaceRefresh;
//重新配置TableView的布局
- (void)prapareTableViewUI;

- (void)reloadTableView;

//重置刷新第一页
- (void)refreshData;

//加载更多
- (void)loadMoreData;

//停止刷新
- (void)stopRefresh;

@end

NS_ASSUME_NONNULL_END
