//
//  UICollectionView+ZMPCollectionViewState.h
//  ZMParentsProject
//
//  Created by mac on 2017/12/9.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *ZMCEmptyDataState NS_EXTENSIBLE_STRING_ENUM;

UIKIT_EXTERN ZMCEmptyDataState const ZMCEmptyDataStateNormal;//初始状态
UIKIT_EXTERN ZMCEmptyDataState const ZMCEmptyDataStateNoData;
UIKIT_EXTERN ZMCEmptyDataState const ZMCEmptyDataStateNetworkDisabled;
UIKIT_EXTERN ZMCEmptyDataState const ZMCEmptyDataStateDynamic;

UIKIT_EXTERN NSString *const ZMCEmptyDataNoDataText;
UIKIT_EXTERN NSString *const ZMCEmptyDataNetworkDisableText;

typedef void(^ZMCEmptyDataStateActionHandler)(UIScrollView *sender);



@interface ZMCEmptyDataManager : NSObject

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, strong) ZMCEmptyDataState state;

@property (nonatomic, assign) BOOL allowScrollWhenEmptyData;

@property (nonatomic, assign, readonly) BOOL isEmpty;

@end

@interface UIScrollView (ZMCScrollViewState)

@property (nonatomic, strong) ZMCEmptyDataManager   *zmc_emptyDataMnager;

- (void)zmc_idle;//恢复初始状态
- (void)zmc_emptyData;
- (void)zmc_networkDisabled;
- (void)zmc_dynamicMode;

//自定义空数据样式
- (void)zmc_registerState:(ZMCEmptyDataState)state
                    title:(nullable NSString *)title
          backgroundImage:(nullable UIImage *)image
       usingActionHandler:(nullable ZMCEmptyDataStateActionHandler)actionHandler;

- (void)zmc_registerState:(ZMCEmptyDataState)state
          attributesTitle:(nullable NSAttributedString *)title
          backgroundImage:(nullable UIImage *)image
       usingActionHandler:(nullable ZMCEmptyDataStateActionHandler)actionHandler;

//单独设置
- (void)zmc_setTitle:(nullable NSString *)title forEmptyState:(ZMCEmptyDataState)state;
- (void)zmc_setAttributedTitle:(nullable NSAttributedString *)attributedTitle forEmptyState:(ZMCEmptyDataState)state;
- (void)zmc_setBackgroundImage:(nullable UIImage *)image forEmptyState:(ZMCEmptyDataState)state;
- (void)zmc_setActionHandler:(nullable ZMCEmptyDataStateActionHandler)handler forEmptyState:(ZMCEmptyDataState)state;

//通用格式无数据及无网络时的样式
- (void)zmc_registerEmptyAndNetworkDisabledWithActionHandler:(nullable ZMCEmptyDataStateActionHandler)actionHandler;
- (void)zmc_setNetworkUnavailableWithActionHandler:(nullable ZMCEmptyDataStateActionHandler)actionHandler;
- (void)zmc_setEmptyDataWithActionHandler:(nullable ZMCEmptyDataStateActionHandler)actionHandler;

@end

NS_ASSUME_NONNULL_END
