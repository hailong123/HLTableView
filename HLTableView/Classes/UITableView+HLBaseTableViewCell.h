//
//  UITableView+HLBaseTableViewCell.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLCellDataAdapter;
@class HLBaseTableViewCell;

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (HLBaseTableViewCell)

- (HLBaseTableViewCell *)dequeueReuseableCellAndLoadDataWithAdapter:(HLCellDataAdapter *)adapter
                                                          indexPath:(NSIndexPath *)indexPath;

- (HLBaseTableViewCell *)dequeueReuseableCellAndLoadDataWithAdapter:(HLCellDataAdapter *)adapter
                                                           delegate:(nullable id<NSObject>)delegate
                                                          indexPath:(NSIndexPath *)indexPath;

- (CGFloat)cellHeightWithAdapter:(HLCellDataAdapter *)adapter;

@end

NS_ASSUME_NONNULL_END
