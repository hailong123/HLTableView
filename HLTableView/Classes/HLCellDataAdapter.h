//
//  HLCellDataAdapter.h
//  ZMPDefaultTable
//
//  Created by SeaDragon on 2018/4/11.
//  Copyright © 2018年 SeaDragon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLCellDataAdapter : NSObject

@property (nonatomic, copy) NSString *cellReuseIdentifier;

@property (nonatomic, weak) id cellDataAdapterDelegate;

@property (nonatomic, strong, nullable) id data;

@property (nonatomic, assign) CGFloat cellHeight;

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(nullable id)data
                                                   cellHeight:(CGFloat)cellHeight
                                      cellDataAdapterDelegate:(id<NSObject>)adapterDelegate;

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(nullable id)data
                                      cellDataAdapterDelegate:(id<NSObject>)adapterDelegate;

@end

NS_ASSUME_NONNULL_END
