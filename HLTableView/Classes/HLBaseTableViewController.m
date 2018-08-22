//
//  HLBaseTableViewController.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLBaseTableViewController.h"

#import "HLBaseTableViewCell.h"
#import "UITableView+EmptyDataSet.h"
#import "UITableView+HLBaseTableViewCell.h"

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
