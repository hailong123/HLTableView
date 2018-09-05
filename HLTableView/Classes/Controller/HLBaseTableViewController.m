//
//  HLBaseTableViewController.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLBaseTableViewController.h"

#import "UITableView+EmptyDataSet.h"

#import "HLBaseTableViewCell.h"
#import "UITableView+HLBaseTableViewCell.h"

#import "HLCustomTableViewHeaderFooterView.h"
#import "UITableViewHeaderFooterView+DataAdapter.h"

@interface HLBaseTableViewController ()
<
    HLEmptyTableManagerDelegate
>

@end

@implementation HLBaseTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self baseTableViewConfig];
    
    [self baseTableViewUI];
    
    [self addRefresh];
}

#pragma mark - Private Method
- (void)baseTableViewConfig {
    self.pageNo         = 1;
    self.footerRefresh  = YES;
    self.tableViewStyle = UITableViewStylePlain;
}

- (void)baseTableViewUI {
    
    self.tableView.frame = self.view.bounds;
    
    [self.view addSubview:self.tableView];
}

- (void)addRefresh {
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                refreshingAction:@selector(refreshData)];
}

#pragma mark - Public Method
- (void)loadMoreData {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

- (void)refreshData {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

- (void)stopRefresh {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - Delegate

#pragma mark HLEmptyTableManagerDelegate
- (void)touchEmptyTableManager:(HLEmptyTableManager *)emptyTableManager {
    [[NSException exceptionWithName:@"方法调用异常"
                             reason:@"此方法需子类重写"
                           userInfo:nil] raise];
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adapters.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HLCellDataAdapter *cellAdapter = self.adapters[indexPath.row];
    
    return cellAdapter.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HLCellDataAdapter *cellAdapter = self.adapters[indexPath.row];
    
    HLBaseTableViewCell *baseTableViewCell = [tableView dequeueReuseableCellAndLoadDataWithAdapter:cellAdapter delegate:cellAdapter.cellDataAdapterDelegate indexPath:indexPath];
    
    return baseTableViewCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (self.headerFooterAdapter.count > 0) {
        
        HLCellHeaderAndFooterDataAdapter *dataAdpter = self.headerFooterAdapter[section];
        
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
    
    if (self.headerFooterAdapter.count > 0) {
        
        HLCellHeaderAndFooterDataAdapter *dataAdpter = self.headerFooterAdapter[section];
        
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
    
    if (self.headerFooterAdapter.count > 0) {
    
        HLCellHeaderAndFooterDataAdapter *dataAdapter = self.headerFooterAdapter[section];
        
        return dataAdapter.footerHeight;
    }
    
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (self.headerFooterAdapter.count > 0) {
        
        HLCellHeaderAndFooterDataAdapter *dataAdapter = self.headerFooterAdapter[section];
        
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
        
        _tableView.emptyManager.emptyManagerDelegate = self;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.tableFooterView = [UIView new];
    }
    
    return _tableView;
}

- (NSMutableArray<HLCellDataAdapter *> *)adapters {
    
    if (!_adapters) {
        _adapters = [NSMutableArray array];
    }
    
    return _adapters;
}

- (NSMutableArray<HLCellHeaderAndFooterDataAdapter *> *)headerFooterAdapter {
    
    if (!_headerFooterAdapter) {
        _headerFooterAdapter = [NSMutableArray array];
    }
    
    return _headerFooterAdapter;
}

- (void)setFooterRefresh:(BOOL)footerRefresh {
    if (footerRefresh) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    } 
}

#pragma mark - Delloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
