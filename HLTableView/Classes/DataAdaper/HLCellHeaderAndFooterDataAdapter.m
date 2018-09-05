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
            cellHeaderAndFooterDataAdapter.footerHeight = 0;
            cellHeaderAndFooterDataAdapter.headerHeight = 0;
        }
            break;
    }
    
    return cellHeaderAndFooterDataAdapter;
}

@end
