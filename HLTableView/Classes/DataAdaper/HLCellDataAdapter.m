//
//  HLCellDataAdapter.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "HLCellDataAdapter.h"

@implementation HLCellDataAdapter

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                      cellDataAdapterDelegate:(nonnull id<NSObject>)adapterDelegate {
    
    HLCellDataAdapter *cellDataAdapter  = [[[self class] alloc] init];
    
    cellDataAdapter.data                    = data;
    cellDataAdapter.cellReuseIdentifier     = reuseIdentifiers;
    cellDataAdapter.cellDataAdapterDelegate = adapterDelegate;
    
    return cellDataAdapter;
}

+ (HLCellDataAdapter *)cellDataAdapterWithAdapterArray:(NSArray <HLCellDataAdapter *>*)adapterArray {
    
    NSAssert([adapterArray isKindOfClass:[NSArray class]], @"必须为数组类型");
    
    HLCellDataAdapter *cellDataAdapter = [[[self class] alloc] init];
    cellDataAdapter.sectionArray       = [NSMutableArray array];
    
    [cellDataAdapter.sectionArray addObjectsFromArray:adapterArray];
    
    return cellDataAdapter;
}

+ (HLCellDataAdapter *)cellDataAdapterWithAdapterArray:(NSArray<HLCellDataAdapter *> *)adapterArray
                                         headerAdapter:(HLCellHeaderAndFooterDataAdapter *)headerAdapter
                                         footreAdapter:(HLCellHeaderAndFooterDataAdapter *)footerAdapter {
    
    HLCellDataAdapter *cellDataAdapter =  [HLCellDataAdapter cellDataAdapterWithAdapterArray:adapterArray];
    cellDataAdapter.headerAdapter      = headerAdapter;
    cellDataAdapter.footerAdapter      = footerAdapter;
    
    return cellDataAdapter;
}

@end
