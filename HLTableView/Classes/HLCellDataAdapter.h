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

@property (nonatomic, weak) id <NSObject> cellDataAdapterDelegate;

@property (nonatomic, strong, nullable) id data;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) CGFloat cellWidth;

@property (nonatomic, assign) NSInteger cellType;


+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                                     cellType:(NSInteger)cellType;

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                                   cellHeight:(CGFloat)cellHeight
                                                    cellWidth:(CGFloat)cellWidth
                                                     cellType:(NSInteger)cellType;

+ (HLCellDataAdapter *)cellDataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifiers
                                                         data:(id)data
                                                     cellType:(NSInteger)cellType;


@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, weak) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
