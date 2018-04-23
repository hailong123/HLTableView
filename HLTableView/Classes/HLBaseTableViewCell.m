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

- (void)setupCell {
    
}

- (void)buildView {
    
}

- (void)loadContent {
    
}

+ (CGFloat)cellHeightWithData:(id)data {
    return 0.f;
}

- (void)loadContentWithAdapter:(HLCellDataAdapter *)cellDataAdapter {

    self.data            = cellDataAdapter.data;
    self.cellDataAdapter = cellDataAdapter;
    
    [self loadContent];
}

- (void)loadContentWithAdapter:(HLCellDataAdapter *)cellDataAdapter
                     indexPath:(NSIndexPath *)indexPath {
    
    self.data            = cellDataAdapter.data;
    self.indexPath       = indexPath;
    self.cellDataAdapter = cellDataAdapter;
    
    [self loadContent];
}

- (void)loadContentWithAdapter:(HLCellDataAdapter *)cellDataAdapter
                     indexPath:(NSIndexPath *)indexPath
                      delegate:(id<NSObject>)delegate {
    
    self.data             = cellDataAdapter.data;
    self.indexPath        = indexPath;
    self.cellDataAdapter  = cellDataAdapter;
    self.baseCellDelegate = delegate;
    
    [self loadContent];
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
+ (HLCellDataAdapter *)dataAdapterWithCellReuseIdetifier:(NSString *)reuseIdetifier
                                                    data:(id)data
                                              cellHeight:(CGFloat)cellHeight
                                                    type:(NSInteger)type {
    
    
    NSString *tmpReuseIdentifier = [[self class] fetchReuseIdentifierWithReuseIdentifier:reuseIdetifier];
    
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier
                                                                data:data
                                                          cellHeight:cellHeight
                                                            cellType:type];
}

+ (HLCellDataAdapter *)dataAdapterWithCellReuseIdetifier:(NSString *)reuseIdetifier
                                                    data:(id)data
                                              cellHeight:(CGFloat)cellHeight
                                               cellWidth:(CGFloat)cellWidth
                                                    type:(NSInteger)type {

    NSString *tmpReuseIdentifier = [[self class] fetchReuseIdentifierWithReuseIdentifier:reuseIdetifier];
    
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier
                                                                data:data
                                                          cellHeight:cellHeight
                                                           cellWidth:cellWidth
                                                            cellType:type];
}

+ (HLCellDataAdapter *)dataAdapterWithData:(id)data cellHeight:(CGFloat)cellHeight type:(NSInteger)type {
    return [[self class] dataAdapterWithCellReuseIdetifier:nil
                                                      data:data
                                                cellHeight:cellHeight
                                                      type:type];
}

+ (HLCellDataAdapter *)dataAdapterWithData:(id)data cellHeight:(CGFloat)cellHeight {
    return [[self class] dataAdapterWithCellReuseIdetifier:nil
                                                      data:data
                                                cellHeight:cellHeight
                                                      type:0];
}

+ (HLCellDataAdapter *)dataAdapterWithData:(id)data {
    return [[self class] dataAdapterWithCellReuseIdetifier:nil
                                                      data:data
                                                cellHeight:0
                                                      type:0];
}

+ (HLCellDataAdapter *)dataAdapterWithCellHeight:(CGFloat)cellHeight {
    return [[self class] dataAdapterWithCellReuseIdetifier:nil
                                                      data:nil
                                                cellHeight:cellHeight
                                                      type:0];
}

+ (HLCellDataAdapter *)fixedHeightTypeDataAdapterWithCellReuseIdetifier:(NSString *)reuseIdetifier
                                                                   data:(id)data
                                                                   type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = [[self class] fetchReuseIdentifierWithReuseIdentifier:reuseIdetifier];
    
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                                            cellType:type];
}

+ (HLCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data type:(NSInteger)type {
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                                            cellType:type];
}

+ (HLCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(id)data {
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:data
                                                          cellHeight:[[self class] cellHeightWithData:data]
                                                            cellType:0];
}

+ (HLCellDataAdapter *)fiexdHeightTypeDataAdapter {
    return [HLCellDataAdapter cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class])
                                                                data:nil
                                                          cellHeight:[[self class] cellHeightWithData:nil]
                                                            cellType:0];
}

#pragma mark Layout type Adapter
+ (HLCellDataAdapter *)layoutTypeAdapterWithCellReuseIdentifier:(NSString *)reuseIdetifier
                                                           data:(id)data
                                                           type:(NSInteger)type {
    return [[self class] dataAdapterWithCellReuseIdetifier:reuseIdetifier
                                                      data:data
                                                cellHeight:UITableViewAutomaticDimension
                                                      type:type];
}

+ (HLCellDataAdapter *)layoutTypeAdapterWithData:(id)data type:(NSInteger)type {
    return [[self class] dataAdapterWithCellReuseIdetifier:NSStringFromClass([self class])
                                                      data:data
                                                cellHeight:UITableViewAutomaticDimension
                                                      type:type];
}

+ (HLCellDataAdapter *)layoutTypeAdapterWithData:(id)data {
    return [[self class] dataAdapterWithCellReuseIdetifier:NSStringFromClass([self class])
                                                      data:data
                                                cellHeight:UITableViewAutomaticDimension
                                                      type:0];
}

+ (HLCellDataAdapter *)layoutTypeAdapter {
    return [[self class] dataAdapterWithCellReuseIdetifier:NSStringFromClass([self class])
                                                      data:nil
                                                cellHeight:UITableViewAutomaticDimension
                                                      type:0];
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

+ (NSString *)fetchReuseIdentifierWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length > 0?reuseIdentifier:NSStringFromClass([self class]);
    
    return tmpReuseIdentifier;
}

@end
