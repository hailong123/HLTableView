//
//  UITableView+HLBaseTableViewCell.m
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import "UITableView+HLBaseTableViewCell.h"

#import "HLCellDataAdapter.h"
#import "HLBaseTableViewCell.h"

@implementation UITableView (HLBaseTableViewCell)

- (HLBaseTableViewCell *)dequeueReuseableCellAndLoadDataWithAdapter:(HLCellDataAdapter *)adapter
                                                          indexPath:(NSIndexPath *)indexPath {
    HLBaseTableViewCell *cell = [self dequeueReuseableCellAndLoadDataWithAdapter:adapter
                                                                        delegate:nil
                                                                       indexPath:indexPath];
    
    [cell loadContentWithAdapter:adapter indexPath:indexPath];
    
    return cell;
}

- (HLBaseTableViewCell *)dequeueReuseableCellAndLoadDataWithAdapter:(HLCellDataAdapter *)adapter
                                                           delegate:(id<HLBaseTableViewCellDelegate>)delegate indexPath:(NSIndexPath *)indexPath {
    
    HLBaseTableViewCell *cell = [self dequeueReuseableCellAndLoadDataWithAdapter:adapter
                                                                        delegate:delegate
                                                                       indexPath:indexPath];
    
    [cell loadContentWithAdapter:adapter indexPath:indexPath];
    
    return cell;
}

- (CGFloat)cellHeightWithAdapter:(HLCellDataAdapter *)adapter {
    return adapter.cellHeight;
}

@end
