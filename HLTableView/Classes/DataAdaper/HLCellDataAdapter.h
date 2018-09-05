//
//  HLCellDataAdapter.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//Cell对应模型类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

/*
    cellHeight cell的高度
 */

@property (nonatomic, assign) CGFloat cellHeight;

/*
    @param  reuseIdentifiers  设置标识符
    @param  data              设置数据
    @param  cellHeight        设置高度
    @param  adapterDelegate   设置代理
 
    @return  HLCellDataAdapter  cell绑定的模型
*/

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(nullable id)data
                                                   cellHeight:(CGFloat)cellHeight
                                      cellDataAdapterDelegate:(id<NSObject>)adapterDelegate;


/*
 @param  reuseIdentifiers  设置标识符
 @param  data              设置数据
 @param  adapterDelegate   设置代理
 
 @return  HLCellDataAdapter  cell绑定的模型
 */

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(nullable id)data
                                      cellDataAdapterDelegate:(id<NSObject>)adapterDelegate;

@end

NS_ASSUME_NONNULL_END
