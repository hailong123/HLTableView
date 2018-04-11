//
//  HLBaseTableViewCellDelegate.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HLBaseTableViewCellDelegate <NSObject>

- (void)loadContentWithCellDataAdapterData:(id)data;

@end
