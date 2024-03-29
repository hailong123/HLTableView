//
//  HLBaseTableViewCell.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HLCellDataAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLBaseTableViewCell : UITableViewCell

@property (nonatomic, weak) HLCellDataAdapter *cellDataAdapter;

/*
    设置cell的代理,通过此代理进行回调
 */

@property (nonatomic, weak) id baseCellDelegate;

/*
    cell对应的数据
 */

@property (nonatomic, weak) id data;

@property (nonatomic, weak) NSIndexPath *indexPath;

@property (nonatomic, weak) UITableView *tableView;

//当前的cell是否正在显示
@property (nonatomic, assign) BOOL display;

#pragma mark Methord you should overwrite

/*
 步骤1:进行初始化
 */

- (void)setupCell;

/*
 步骤2:进行视图的创建
 */

- (void)buildView;

/*
 步骤3:进行数据填充
 */

- (void)loadContent;

#pragma mark Constructor Method

/*
 @param data             填充的数据
 @param adapterDelegate  设置代理
 
 @return HLCellDataAdapter
 */

+ (HLCellDataAdapter *)dataAdapterWithData:(nullable id)data
                           adapterDelegate:(nullable id<NSObject>)adapterDelegate;

#pragma mark Load Content
/*
    进行数据的加载
 
    @param cellDataAdapter  对应的模型
    @param indexPath        对应的索引
    @param delegate         代理
    @param tableView        拥有的tableView
 
 */

- (void)loadContentWithAdapter:(HLCellDataAdapter *)cellDataAdapter
                     indexPath:(NSIndexPath *)indexPath
                      delegate:(nullable id<NSObject>)delegate
                     tableView:(UITableView *)tableView;

#pragma mark Register cell with TableView
/*
    调用此方法进行注册cell
 
    @param tableView        注册的tableView
    @param reuseIdentifier  唯一标识
 
 */

+ (void)registerToTableView:(UITableView *)tableView
            reuseIdentifier:(NSString *)reuseIdentifier;

/*
 调用此方法进行注册cell, 标识为默认---类名
 
 @param tableView        注册的tableView
 
 */
+ (void)registerToTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
