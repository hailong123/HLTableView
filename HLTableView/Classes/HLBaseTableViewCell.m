//
//  HLBaseTableViewCell.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLBaseTableViewCell.h"

#import "HLActionManager.h"

@implementation HLBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
        [self buildView];
    }
    
    return self;
}

- (void)setupCell {
}
- (void)buildView {
}

- (void)loadContent {
    @throw [NSException exceptionWithName:@"方法错误"
                                   reason:@"方法调用错误,此方法必须子类重载"
                                 userInfo:nil];
}

+ (CGFloat)cellHeightWithData:(id)data {
    return 0.f;
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
                                cellHeight:(CGFloat)cellHeight
                           adapterDelegate:(nonnull id<NSObject>)adapterDelegate {
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                                          cellHeight:cellHeight
                                             cellDataAdapterDelegate:adapterDelegate];
}

+ (HLCellDataAdapter *)dataAdapterWithData:(id)data
                           adapterDelegate:(nonnull id<NSObject>)adapterDelegate {
    return [[self class] dataAdapterWithData:data cellHeight:0 adapterDelegate:adapterDelegate];
}


+ (HLCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data
                                          adapterDelegate:(nonnull id<NSObject>)adapterDelegate {
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                             cellDataAdapterDelegate:adapterDelegate];
}

#pragma mark  基于 target **** action事件
+ (void)addTarget:(id)target action:(SEL)action identifier:(NSString *)identifier {
    
    HLActionItem *actionItem = [[HLActionItem alloc] initWithActionItemWithTarget:target action:action];
    
    [[HLActionManager shareActionManager].actionDictionary setObject:actionItem forKey:identifier];
}

- (void)removeActionWithIdentifier:(NSString *)identifier {
    
    NSParameterAssert(identifier);
    
    [[HLActionManager shareActionManager].actionDictionary removeObjectForKey:identifier];
    
}

- (void)preformActionWithIdentifier:(NSString *)identifier {
    
    NSParameterAssert(identifier);
    
    HLActionItem *actionItem = [HLActionManager shareActionManager].actionDictionary[identifier];
    
    if (actionItem.target && [actionItem.target respondsToSelector:actionItem.action]) {
        [actionItem.target performSelector:actionItem.action
                                withObject:self.cellDataAdapter
                                afterDelay:0];
    }
}

#pragma mark
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated {
    
    if (self.tableView && self.cellDataAdapter) {
        
        if (animated) {
         
            _cellDataAdapter.cellHeight = height;
            [self.tableView beginUpdates];
            [self.tableView endUpdates];
            
        } else {
            
            _cellDataAdapter.cellHeight = height;
            
            [self.tableView reloadData];
        }
    }
}

+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
}

+ (void)registerToTableView:(UITableView *)tableView {
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}

#pragma mark Setter And Getter

@end
