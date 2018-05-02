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

//此参数接受子视图自定义的事件代理
@property (nonatomic, weak) id baseCellDelegate;

@property (nonatomic, weak) id data;

@property (nonatomic, weak) NSIndexPath *indexPath;

@property (nonatomic, weak) UITableView *tableView;

//当前的cell是否正在显示
@property (nonatomic, assign) BOOL display;

#pragma mark Methord you should overwrite

- (void)setupCell;

- (void)buildView;

- (void)loadContent;

+ (CGFloat)cellHeightWithData:(nullable id)data;

#pragma mark Userful Methord
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated;

#pragma mark Constructor Method

+ (HLCellDataAdapter *)dataAdapterWithData:(nullable id)data
                                cellHeight:(CGFloat)cellHeight;

+ (HLCellDataAdapter *)dataAdapterWithData:(nullable id)data;


//必须实现 cellHeightWithData 方法来获取cell的高度
+ (HLCellDataAdapter *)fixedHeightTypeDataAdapterWithData:(nullable id)data;

#pragma mark Load Content
- (void)loadContentWithAdapter:(HLCellDataAdapter *)cellDataAdapter
                     indexPath:(NSIndexPath *)indexPath
                      delegate:(nullable id<NSObject>)delegate
                     tableView:(UITableView *)tableView;

#pragma mark Register cell with TableView
+ (void)registerToTableView:(UITableView *)tableView
            reuseIdentifier:(NSString *)reuseIdentifier;


+ (void)registerToTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
