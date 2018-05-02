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

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                      cellDataAdapterDelegate:(nonnull id<NSObject>)adapterDelegate {
    
    HLCellDataAdapter *cellDataAdapter  = [[[self class] alloc] init];
    
    cellDataAdapter.data                    = data;
    cellDataAdapter.cellHeight              = cellHeight;
    cellDataAdapter.cellReuseIdentifier     = reuseIdentifiers;
    cellDataAdapter.cellDataAdapterDelegate = adapterDelegate;
    
    return cellDataAdapter;
}

@end
