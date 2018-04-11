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
                                                     cellType:(NSInteger)cellType {
    
    HLCellDataAdapter *cellDataAdapter  = [[[self class] alloc] init];
    
    cellDataAdapter.data                = data;
    cellDataAdapter.cellType            = cellType;
    cellDataAdapter.cellReuseIdentifier = reuseIdentifiers;
    
    return cellDataAdapter;
}

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                                     cellType:(NSInteger)cellType {
    
    HLCellDataAdapter *cellDataAdapter  = [[[self class] alloc] init];
    
    cellDataAdapter.data                = data;
    cellDataAdapter.cellType            = cellType;
    cellDataAdapter.cellHeight          = cellHeight;
    cellDataAdapter.cellReuseIdentifier = reuseIdentifiers;
    
    return cellDataAdapter;
}

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                                    cellWidth:(CGFloat)cellWidth
                                                     cellType:(NSInteger)cellType {
    
    HLCellDataAdapter *cellDataAdapter  = [[[self class] alloc] init];
    
    cellDataAdapter.data                = data;
    cellDataAdapter.cellType            = cellType;
    cellDataAdapter.cellWidth           = cellWidth;
    cellDataAdapter.cellHeight          = cellHeight;
    cellDataAdapter.cellReuseIdentifier = reuseIdentifiers;
    
    return cellDataAdapter;
}

@end
