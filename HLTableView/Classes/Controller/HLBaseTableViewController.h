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

//******** 无网络相关key ********//
UIKIT_EXTERN NSString * const NetworkErrorDesFontKey;
UIKIT_EXTERN NSString * const NetworkErrorTitleFontKey;

UIKIT_EXTERN NSString * const NetworkErrorDesKey;
UIKIT_EXTERN NSString * const NetworkErrorTitleKey;

UIKIT_EXTERN NSString * const NetworkErrorDesColorKey;
UIKIT_EXTERN NSString * const NetworkErrorTitleColorKey;

UIKIT_EXTERN NSString * const NetworkErrorImageNamedKey;
//*********** END **********//

//********* 无数据相关配置 **********//
UIKIT_EXTERN NSString * const NoDataDesFontKey;
UIKIT_EXTERN NSString * const NoDataTitleFontKey;

UIKIT_EXTERN NSString * const NoDataDesKey;
UIKIT_EXTERN NSString * const NoDataTitleKey;

UIKIT_EXTERN NSString * const NoDataDesColorKey;
UIKIT_EXTERN NSString * const NoDataTitleColorKey;

UIKIT_EXTERN NSString * const NoDataImageNamedKey;
//*********** END **********//

//设置无网络数据时的相关配置
@protocol BaseTableViewEmptyProtocl <NSObject>

//无网的数据配置
- (NSDictionary *)networkErrorConfiguration;

//无数据的配置
- (NSDictionary *)nodataConfiguration;

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
 是否需要默认的刷新控件
 */

@property (nonatomic, assign, getter=isNormalHeaderRefresh) BOOL normalHeaderRefresh;

/*
 是否需要底部刷新空间 默认为YES
 */

@property (nonatomic, assign, getter=isFooterRefresh)  BOOL footerRefresh;

//是否使用自定义的空数据视图
@property (nonatomic, strong) UIView *customEmptyView;

@property (nonatomic, weak) id <BaseTableViewEmptyProtocl> emptySourceDelegate;

#pragma mark SubClassOverWriteConfig
//!!!!:以下方法无需调用 super 方法
//重新配置无数据相关信息
- (void)noDataConfig;
//重新配置无网络相关的数据信息
- (void)noNetworkConfig;
//重新配置TableViewStyle default UITableViewStyleGrouped
- (void)configTableViewStyle;
//替换默认配置的刷新控件  默认均为 YES
- (void)replaceRefresh;
//重新配置TableView的布局
- (void)prapareTableViewUI;

//重置刷新第一页
- (void)refreshData;

//加载更多
- (void)loadMoreData;

//停止刷新
- (void)stopRefresh;

@end

NS_ASSUME_NONNULL_END
