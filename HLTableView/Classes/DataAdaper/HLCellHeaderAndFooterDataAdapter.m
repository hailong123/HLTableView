//
//  HLCellHeaderAndFooterDataAdapter.m
//  HLTableView
//
//  Created by SeaDragon on 2018/8/28.
//

#import "HLCellHeaderAndFooterDataAdapter.h"

@implementation HLCellHeaderAndFooterDataAdapter

+ (HLCellHeaderAndFooterDataAdapter *)cellHeaderAndFooterDataAdapterWithIdentifier:(NSString *)identifier
                                                                          delegate:(nullable id)delegate
                                                                            height:(CGFloat)height
                                                                              data:(nullable id)data
                                                                              type:(AdapterHeightType)type {
 
    HLCellHeaderAndFooterDataAdapter *cellHeaderAndFooterDataAdapter = [[[self class] alloc] init];
    
    cellHeaderAndFooterDataAdapter.data                = data;
    cellHeaderAndFooterDataAdapter.type                = type;
    cellHeaderAndFooterDataAdapter.reuseIdentifier     = identifier;
    cellHeaderAndFooterDataAdapter.dataAdapterDelegate = delegate;
    
    switch (type) {
        case AdapterHeightTypeAll:
        {
            cellHeaderAndFooterDataAdapter.footerHeight = height;
            cellHeaderAndFooterDataAdapter.headerHeight = height;
        }
            break;
            
        case AdapterHeightTypeFooter:
        {
            cellHeaderAndFooterDataAdapter.footerHeight = height;
        }
            break;
        case AdapterHeightTypeHeader:
        {
            cellHeaderAndFooterDataAdapter.headerHeight = height;
        }
            break;
        case AdapterHeightTypeDefault:
        {
            cellHeaderAndFooterDataAdapter.footerHeight = CGFLOAT_MIN;
            cellHeaderAndFooterDataAdapter.headerHeight = CGFLOAT_MIN;
        }
            break;
    }
    
    return cellHeaderAndFooterDataAdapter;
}

+ (HLCellHeaderAndFooterDataAdapter *)cellHeaderAndFooterDataAdapterWithAdapterArray:(NSArray<HLCellHeaderAndFooterDataAdapter *> *)adapterArray {
    
    NSAssert([adapterArray isKindOfClass:[NSArray class]], @"必须为数组类型");
    
    HLCellHeaderAndFooterDataAdapter *cellDataAdapter = [[[self class] alloc] init];
    cellDataAdapter.sectionArray                      = [NSMutableArray array];
    
    [cellDataAdapter.sectionArray addObjectsFromArray:adapterArray];
    
    return cellDataAdapter;
}


@end
