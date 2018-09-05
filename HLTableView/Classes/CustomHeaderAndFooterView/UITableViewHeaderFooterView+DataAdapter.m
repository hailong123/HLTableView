//
//  UITableViewHeaderFooterView+DataAdapter.m
//  HLTableView
//
//  Created by SeaDragon on 2018/8/28.
//

#import "UITableViewHeaderFooterView+DataAdapter.h"

#import "HLCustomTableViewHeaderFooterView.h"

@implementation UITableViewHeaderFooterView (DataAdapter)

#pragma mark - UITableView

+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier {
    
    NSString *reuseIdentifier = identifier.length <= 0?NSStringFromClass([self class]):identifier;
    
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:reuseIdentifier];
}

+ (void)registerToTableView:(UITableView *)tableView {
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([self class])];
}

#pragma mark - DataAdapter

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithHeight:(CGFloat)height {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:nil height:height data:nil type:AdapterHeightTypeAll];
}

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithData:(id)data
                                                   height:(CGFloat)height
                                                 delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:delegate height:height data:data type:AdapterHeightTypeAll];
}

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithHeight:(CGFloat)height
                                                       type:(AdapterHeightType)type
                                                   delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:delegate height:height data:nil type:type];
}

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithData:(id)data
                                                   height:(CGFloat)height
                                                     type:(AdapterHeightType)type
                                                 delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:delegate height:height data:data type:type];
}

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithReuseIdentifier:(NSString *)identifier
                                                                data:(id)data
                                                              height:(CGFloat)height
                                                                type:(AdapterHeightType)type
                                                            delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:identifier delegate:delegate height:height data:data type:type];
}

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapter {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:nil height:[[self class] heightWithData:nil] data:nil type:AdapterHeightTypeAll];
}

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapterWithDadta:(id)data
                                                                 delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:delegate height:[[self class] heightWithData:data] data:data type:AdapterHeightTypeAll];
}

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapterWithDadta:(id)data
                                                                     type:(AdapterHeightType)type
                                                                 delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:NSStringFromClass([self class]) delegate:delegate height:[[self class] heightWithData:data] data:data type:type];
}

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapterWithReuseIdentifier:(NSString *)identifier
                                                                              dadta:(id)data
                                                                               type:(AdapterHeightType)type
                                                                           delegate:(id<NSObject>)delegate {
    return [HLCellHeaderAndFooterDataAdapter cellHeaderAndFooterDataAdapterWithIdentifier:identifier delegate:delegate height:[[self class] heightWithData:data] data:data type:type];
}

@end
