//
//  HLBaseTableViewCell.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLBaseTableViewCell.h"

@implementation HLBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
        [self buildView];
    }
    
    return self;
}

- (void)setupCell {}

- (void)buildView {}

- (void)loadContent {
    @throw [NSException exceptionWithName:@"方法错误"
                                   reason:[NSString stringWithFormat:@"方法调用错误,%@ 此方法必须子类重载",NSStringFromSelector(@selector(loadContent))]
                                 userInfo:nil];
}

- (void)loadContentWithAdapter:(HLCellDataAdapter *)cellDataAdapter
                     indexPath:(NSIndexPath *)indexPath
                      delegate:(id<NSObject>)delegate
                     tableView:(UITableView *)tableView {
    
    self.data             = cellDataAdapter.data;
    self.indexPath        = indexPath;
    self.tableView        = tableView;
    self.cellDataAdapter  = cellDataAdapter;
    self.baseCellDelegate = delegate;
    
    [self loadContent];
}

#pragma mark 默认的配置

+ (HLCellDataAdapter *)dataAdapterWithData:(id)data
                           adapterDelegate:(id<NSObject>)adapterDelegate {
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                             cellDataAdapterDelegate:adapterDelegate];
}

#pragma mark


+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
}

+ (void)registerToTableView:(UITableView *)tableView {
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}

#pragma mark Setter And Getter

@end
