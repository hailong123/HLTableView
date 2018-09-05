//
//  UITableViewHeaderFooterView+DataAdapter.h
//  HLTableView
//
//  Created by SeaDragon on 2018/8/28.
//

#import <UIKit/UIKit.h>

#import "HLCellHeaderAndFooterDataAdapter.h"

@interface UITableViewHeaderFooterView (DataAdapter)

#pragma mark - UITableView

+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier;

+ (void)registerToTableView:(UITableView *)tableView;

#pragma mark - DataAdapter

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithHeight:(CGFloat)height;

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithData:(id)data
                                                   height:(CGFloat)height
                                                 delegate:(id<NSObject>)delegate;

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithHeight:(CGFloat)height
                                                       type:(AdapterHeightType)type
                                                   delegate:(id<NSObject>)delegate;

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithData:(id)data
                                                   height:(CGFloat)height
                                                     type:(AdapterHeightType)type
                                                 delegate:(id<NSObject>)delegate;

+ (HLCellHeaderAndFooterDataAdapter *)dataAdapterWithReuseIdentifier:(NSString *)identifier
                                                                data:(id)data
                                                              height:(CGFloat)height
                                                                type:(AdapterHeightType)type
                                                            delegate:(id<NSObject>)delegate;

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapter;

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapterWithDadta:(id)data
                                                                 delegate:(id<NSObject>)delegate;

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapterWithDadta:(id)data
                                                                     type:(AdapterHeightType)type
                                                                 delegate:(id<NSObject>)delegate;

+ (HLCellHeaderAndFooterDataAdapter *)fixedHeightTypeDataAdapterWithReuseIdentifier:(NSString *)identifier
                                                                              dadta:(id)data
                                                                               type:(AdapterHeightType)type
                                                                           delegate:(id<NSObject>)delegate;

@end
