//
//  HLBaseTableViewController.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLBaseTableViewController.h"

#import "HLBaseTableViewCell.h"
#import "UITableView+HLBaseTableViewCell.h"

#import "HLCustomTableViewHeaderFooterView.h"
#import "HLBaseTableViewController+EmptyProtocl.h"
#import "UITableViewHeaderFooterView+DataAdapter.h"

NSString * const NetworkErrorDesKey        = @"NetworkErrorDesKey";
NSString * const NetworkErrorTitleKey      = @"NetworkErrorTitleKey";
NSString * const NetworkErrorDesFontKey    = @"NetworkErrorDesFontKey";
NSString * const NetworkErrorDesColorKey   = @"NetworkErrorDesColorKey";
NSString * const NetworkErrorTitleFontKey  = @"NetworkErrorFontSizeKey";
NSString * const NetworkErrorTitleColorKey = @"NetworkErrorTitleColorKey";
NSString * const NetworkErrorImageNamedKey = @"NetworkErrorImageNamedKey";

NSString * const NoDataDesKey        = @"NoDataDesKey";
NSString * const NoDataTitleKey      = @"NoDataTitleKey";
NSString * const NoDataDesFontKey    = @"NoDataDesFontKey";
NSString * const NoDataDesColorKey   = @"NoDataDesColorKey";
NSString * const NoDataTitleFontKey  = @"NoDataFontSizeKey";
NSString * const NoDataTitleColorKey = @"NoDataTitleColorKey";
NSString * const NoDataImageNamedKey = @"NoDataImageNamedKey";

@interface HLBaseTableViewController ()
<
    HLEmptyTableManagerDelegate
>
@end

@implementation HLBaseTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configTableViewStyle];
    
    [self baseTableViewConfig];
    
    [self prapareTableViewUI];

    [self replaceRefresh];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (!self.customEmptyView) {
        
        [self noNetworkConfig];
        
        [self noDataConfig];
    } else {
        
    }
}

#pragma mark - Private Method
- (void)baseTableViewConfig {
    self.pageNo         = 1;
}

- (void)configTableViewStyle {
    self.tableViewStyle = UITableViewStyleGrouped;
}

- (void)replaceRefresh {
    self.footerRefresh       = YES;
    self.normalHeaderRefresh = YES;
}

//子类如有不同,可重写此方法
- (void)prapareTableViewUI {

    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        if(@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.safeAreaInsets.top);
            make.bottom.mas_equalTo(self.view.safeAreaInsets.bottom);
        } else {
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }
    }];
}

- (void)configEmptyView {
    
}


- (void)noNetworkConfig {
    [self.tableView configurationWithImageNamed:[self imageNamedConfigWithoutNetwork:YES]
                                          title:[self titleConfigWithoutNetwork:YES]
                                     attributes:@{
                                                  NSForegroundColorAttributeName:[self titleColorConfigWithoutNetwork:YES],
                                                  NSFontAttributeName:[self titleFontConfigWithoutNetwork:YES]
                                                  }
                                    description:[self desConfigWithoutNetwork:YES]
                                  desAttributes:@{
                                                  NSForegroundColorAttributeName:[self desColorConfigWithoutNetwork:YES],
                                                  NSFontAttributeName:[self desFontConfigWithoutNetwork:YES]
                                                  }
                                          state:HLEmptyTableManagerStateNoNetwork];
}

- (void)noDataConfig {
    [self.tableView configurationWithImageNamed:[self imageNamedConfigWithoutNetwork:NO]
                                          title:[self titleConfigWithoutNetwork:NO]
                                     attributes:@{
                                                  NSForegroundColorAttributeName:[self titleColorConfigWithoutNetwork:NO],
                                                  NSFontAttributeName:[self titleFontConfigWithoutNetwork:NO]
                                                  }
                                    description:[self desConfigWithoutNetwork:NO]
                                  desAttributes:@{
                                                  NSForegroundColorAttributeName:[self desColorConfigWithoutNetwork:NO],
                                                  NSFontAttributeName:[self desFontConfigWithoutNetwork:NO]
                                                  }
                                          state:HLEmptyTableManagerStateNoData];
}

#pragma mark - Public Method
- (void)loadMoreData {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:[NSString stringWithFormat:@"%@-此方法需子类重写",NSStringFromSelector(@selector(loadMoreData))]
                           userInfo:nil] raise];
}

- (void)refreshData {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:[NSString stringWithFormat:@"%@-此方法需子类重写",NSStringFromSelector(@selector(refreshData))]
                           userInfo:nil] raise];
}

- (void)stopRefresh {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - HLCellDataAdapter
- (BOOL)hasMoreSection {
    HLCellDataAdapter *adapter = self.adapters.firstObject;
    return adapter.sectionArray.count > 0;
}

- (NSInteger)fetchCellDataAdapterCount {
    return self.adapters.count;
}

- (NSInteger)fetchSubCellDataAdapterCountWithIndexPath:(NSInteger)section {
    return self.adapters[section].sectionArray.count;
}

- (HLCellDataAdapter *)cellDataAdapterWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < self.adapters.count) {
        return self.adapters[indexPath.section].sectionArray[indexPath.row];
    }
    
    return nil;
}

#pragma mark - HLCellHeaderAndFooterDataAdapter

- (HLCellHeaderAndFooterDataAdapter *)cellFooterDataAdapterWithSection:(NSInteger)section {
    if ([self hasMoreSection]) {
        if (section < self.adapters[section]) {
            return self.adapters[section].footerAdapter;
        }
    } else {
        if (section < self.adapters.count) {
            return self.adapters[section].footerAdapter;
        }
    }
    
    return nil;
}

- (HLCellHeaderAndFooterDataAdapter *)cellHeaderDataAdapterWithSection:(NSInteger)section {
    if ([self hasMoreSection]) {
        if (section < self.adapters[section]) {
            return self.adapters[section].headerAdapter;
        }
    } else {
        if (section < self.adapters.count) {
            return self.adapters[section].headerAdapter;
        }
    }
    
    return nil;
}

#pragma mark - Delegate

#pragma mark HLEmptyTableManagerDelegate
- (void)touchEmptyTableManager:(HLEmptyTableManager *)emptyTableManager {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:[NSString stringWithFormat:@"%@-此方法需子类重写",NSStringFromSelector(@selector(touchEmptyTableManager:))]
                           userInfo:nil] raise];
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if ([self hasMoreSection]) {
        return self.adapters.count;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self hasMoreSection]) {
        return [self fetchSubCellDataAdapterCountWithIndexPath:section];
    }
    
    return self.adapters.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self hasMoreSection]) {
        
        HLCellDataAdapter *cellAdapter = [self cellDataAdapterWithIndexPath:indexPath];
        
        return cellAdapter.cellHeight;
    }
    
    HLCellDataAdapter *cellAdapter = self.adapters[indexPath.row];
    
    return cellAdapter.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HLCellDataAdapter *cellAdapter = nil;
    
    if ([self hasMoreSection]) {
        cellAdapter = [self cellDataAdapterWithIndexPath:indexPath];
    } else {
        cellAdapter = self.adapters[indexPath.row];
    }

    HLBaseTableViewCell *baseTableViewCell = [tableView dequeueReuseableCellAndLoadDataWithAdapter:cellAdapter delegate:cellAdapter.cellDataAdapterDelegate indexPath:indexPath];
    
    baseTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return baseTableViewCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HLCellHeaderAndFooterDataAdapter *dataAdpter = [self cellHeaderDataAdapterWithSection:section];
    
    if (dataAdpter && dataAdpter.headerHeight > 0) {

        HLCustomTableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:dataAdpter.reuseIdentifier];
        headerView.data     = dataAdpter.data;
        headerView.section  = section;
        headerView.delegate = dataAdpter.dataAdapterDelegate;
        [headerView loadContent];
        
        return headerView;
        
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    HLCellHeaderAndFooterDataAdapter *dataAdpter = [self cellHeaderDataAdapterWithSection:section];
    
    if (dataAdpter && dataAdpter.footerHeight > 0) {
        
        HLCustomTableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:dataAdpter.reuseIdentifier];
        footerView.data     = dataAdpter.data;
        footerView.section  = section;
        footerView.delegate = dataAdpter.dataAdapterDelegate;
        [footerView loadContent];

        return footerView;
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    HLCellHeaderAndFooterDataAdapter *dataAdapter = [self cellFooterDataAdapterWithSection:section];
    
    if (dataAdapter && dataAdapter.footerHeight > 0) {
        
        return dataAdapter.footerHeight;
    }
    
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    HLCellHeaderAndFooterDataAdapter *dataAdapter = [self cellHeaderDataAdapterWithSection:section];
    
    if (dataAdapter && dataAdapter.headerHeight > 0) {
        return dataAdapter.headerHeight;
    }
    
    return CGFLOAT_MIN;
}

#pragma mark - Setter And Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:self.tableViewStyle];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.tableFooterView = [UIView new];
    }
    
    if (_tableView.emptyManager.emptyManagerDelegate != self) {
        _tableView.emptyManager.emptyManagerDelegate = self;
    }
    
    return _tableView;
}

- (NSMutableArray<HLCellDataAdapter *> *)adapters {
    
    if (!_adapters) {
        _adapters = [NSMutableArray array];
    }
    
    return _adapters;
}

- (void)setFooterRefresh:(BOOL)footerRefresh {
    if (footerRefresh) {
        if (!self.tableView.mj_footer) {
            self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        }
    } else {
        self.tableView.mj_footer = nil;
    }
}

- (void)setNormalHeaderRefresh:(BOOL)normalHeaderRefresh {
    if (normalHeaderRefresh) {
        if (!self.tableView.mj_header) {
            self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
        }
    } else {
        self.tableView.mj_header = nil;
    }
}

#pragma mark - Delloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
