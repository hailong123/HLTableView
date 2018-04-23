//
//  HLTwoDemoTableViewCell.h
//  HLTableView_Example
//
//  Created by SeaDragon on 2018/4/12.
//  Copyright © 2018年 771145867@qq.com. All rights reserved.
//

#import "HLBaseTableViewCell.h"

@class HLTwoDemoTableViewCell;

@protocol HLTwoDemoTableViewCellDelegate <NSObject>

- (void)twoDemoTableViewCell:(HLTwoDemoTableViewCell *)cell;

@end

@interface HLTwoDemoTableViewCell : HLBaseTableViewCell

@end
