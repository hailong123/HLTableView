//
//  HLBaseTableViewController.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLBaseTableViewController.h"

#import "UITableView+FDTemplateLayoutCell.h"

#import "HLBaseTableViewCell.h"
#import "UITableView+HLBaseTableViewCell.h"

#import "HLCustomTableViewHeaderFooterView.h"
#import "UITableViewHeaderFooterView+DataAdapter.h"

@interface HLBaseTableViewController ()

@property (nonatomic, assign) BOOL moreSection;

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

#pragma mark - Private Method
- (void)moreSections {
    for (HLCellDataAdapter *adapter in self.adapters) {
        if (adapter.sectionArray.count > 0) {
            _moreSection = YES;
        }
    }
}

- (void)baseTableViewConfig {
    self.pageNo = 1;
}

- (void)configTableViewStyle {
    self.tableViewStyle = UITableViewStyleGrouped;
}

- (void)replaceRefresh {
    self.footerRefresh = YES;
    self.headerRefresh = YES;
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

#pragma mark - Public Method

- (void)reloadTableView {
    
    [self moreSections];
    
    [self.tableView reloadData];
}

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

- (NSInteger)fetchCellDataAdapterCount {
    return self.adapters.count;
}

- (NSInteger)fetchSubCellDataAdapterCountWithIndexPath:(NSInteger)section {
    return self.adapters[section].sectionArray.count;
}

- (HLCellDataAdapter *)cellDataAdapterWithIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section < self.adapters.count) {
        
        HLCellDataAdapter *adapter= self.adapters[indexPath.section];
        
        if (adapter.sectionArray.count > 0) {
            return self.adapters[indexPath.section].sectionArray[indexPath.row];;
        }
        
        return adapter;
    }
    
    return nil;
}

#pragma mark - HLCellHeaderAndFooterDataAdapter

- (HLCellHeaderAndFooterDataAdapter *)cellFooterDataAdapterWithSection:(NSInteger)section {
    
    if (section < self.adapters.count) {
        
        HLCellDataAdapter *adapter = self.adapters[section];

        return adapter.footerAdapter;
    }
    
    return nil;
}

- (HLCellHeaderAndFooterDataAdapter *)cellHeaderDataAdapterWithSection:(NSInteger)section {
    
    if (section < self.adapters.count) {
        
        HLCellDataAdapter *adapter = self.adapters[section];

        return adapter.headerAdapter;
    }
    
    return nil;
}

#pragma mark - Delegate

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (_moreSection) {
        return self.adapters.count;
    }
    
    if (self.adapters.count > 0) {
        return 1;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_moreSection) {
       return self.adapters[section].sectionArray.count;
    }
    
    return self.adapters.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HLCellDataAdapter *adapter;
    
    if (_moreSection) {
        adapter = self.adapters[indexPath.section].sectionArray[indexPath.row];
    } else {
        adapter = self.adapters[indexPath.row];
    }
    
    return [tableView fd_heightForCellWithIdentifier:adapter.cellReuseIdentifier
                                    cacheByIndexPath:indexPath
                                       configuration:^(HLBaseTableViewCell *cell) {
        [cell loadContentWithAdapter:adapter
                           indexPath:indexPath
                            delegate:adapter.cellDataAdapterDelegate
                           tableView:tableView];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HLCellDataAdapter *cellAdapter = nil;
    
    if (_moreSection) {
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
    
    HLCellHeaderAndFooterDataAdapter *dataAdpter = [self cellFooterDataAdapterWithSection:section];
    
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

- (void)setHeaderRefresh:(BOOL)headerRefresh {
    if (headerRefresh) {
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
