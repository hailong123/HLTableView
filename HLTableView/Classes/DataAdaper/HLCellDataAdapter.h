//
//  HLCellDataAdapter.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//Cell对应模型类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HLCellHeaderAndFooterDataAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLCellDataAdapter : NSObject

/*
    cell的标识符
 */

@property (nonatomic, copy) NSString *cellReuseIdentifier;

/*
    cell的代理,通过设置代理进行回调
 */

@property (nonatomic, weak) id cellDataAdapterDelegate;

/*
    cell 绑定的数据
 */

@property (nonatomic, strong, nullable) id data;

//是否支持多 section 模式
@property (nonatomic, strong) NSMutableArray<HLCellDataAdapter *> *sectionArray;

//头视图模型
@property (nonatomic, strong) HLCellHeaderAndFooterDataAdapter *headerAdapter;

//尾视图模型
@property (nonatomic, strong) HLCellHeaderAndFooterDataAdapter *footerAdapter;

/*
 @param  reuseIdentifiers  设置标识符
 @param  data              设置数据
 @param  adapterDelegate   设置代理
 
 @return  HLCellDataAdapter  cell绑定的模型
 */

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(nullable id)data
                                      cellDataAdapterDelegate:(id<NSObject>)adapterDelegate;

/*
 @param adapterArray 装在多section的CellDataAdapter模型
 @return HLCellDataAdapter  cell绑定的模型
 */

+ (HLCellDataAdapter *)cellDataAdapterWithAdapterArray:(NSArray <HLCellDataAdapter *>*)adapterArray;

/*
 @param adapterArray  装在多section的CellDataAdapter模型
 @param headerAdapter 头视图模型
 @param footerAdapter 尾视图模型
 @return HLCellDataAdapter  cell绑定的模型
 */

+ (HLCellDataAdapter *)cellDataAdapterWithAdapterArray:(NSArray <HLCellDataAdapter *>*)adapterArray
                                         headerAdapter:(nullable HLCellHeaderAndFooterDataAdapter *)headerAdapter
                                         footreAdapter:(nullable HLCellHeaderAndFooterDataAdapter *)footerAdapter;

@end

NS_ASSUME_NONNULL_END
