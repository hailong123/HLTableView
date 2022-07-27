//
//  UITableView+HLBaseTableViewCell.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//UITableView的分类

#import <UIKit/UIKit.h>

@class HLCellDataAdapter;
@class HLBaseTableViewCell;

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (HLBaseTableViewCell)

/*
    @param adapter   cell绑定的模型
    @param indexPath 指定的索引
 
    @return HLBaseTableViewCell
 */

- (HLBaseTableViewCell *)dequeueReuseableCellAndLoadDataWithAdapter:(HLCellDataAdapter *)adapter
                                                          indexPath:(NSIndexPath *)indexPath;

/*
    @param adapter   cell绑定的模型
    @param delegate  cell的代理
    @param indexPath 指定的索引
 
    @return HLBaseTableViewCell
 */

- (HLBaseTableViewCell *)dequeueReuseableCellAndLoadDataWithAdapter:(HLCellDataAdapter *)adapter
                                                           delegate:(nullable id<NSObject>)delegate
                                                          indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
