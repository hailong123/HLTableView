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

#import "UITableView+EmptyDataSet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTableViewEmptyProtocl <NSObject>

- (NSString *)noNetworkDes;
- (UIFont *)noNetworkFontSize;
- (UIColor *)noNetowrkDesColor;
- (NSString *)noNetworkImageNamed;

- (NSString *)noDataDes;
- (UIFont *)noDataFontSize;
- (UIColor *)noDatakDesColor;
- (NSString *)noDataImageNamed;

@end

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
    组装头尾视图模型
 */
@property (nonatomic, strong) NSMutableArray <HLCellHeaderAndFooterDataAdapter *> *headerFooterAdapter;

/*
    是否需要底部刷新空间 默认为YES
 */

@property (nonatomic, assign, getter=isFooterRefresh)  BOOL footerRefresh;

@property (nonatomic, weak) id <BaseTableViewEmptyProtocl> emptySourceDelegate;

#pragma mark SubClassConfig
- (void)noDataConfig;
- (void)noNetworkConfig;

//重置刷新第一页
- (void)refreshData;

//加载更多
- (void)loadMoreData;

//停止刷新
- (void)stopRefresh;

@end

NS_ASSUME_NONNULL_END
