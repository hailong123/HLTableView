//
//  UICollectionView+ZMPCollectionViewState.m
//  ZMParentsProject
//
//  Created by mac on 2017/12/9.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "UIScrollView+ZMCScrollViewState.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <objc/runtime.h>

typedef NSMutableDictionary<ZMCEmptyDataState, ZMCEmptyDataStateActionHandler> ZMPActionHandlerDictionary;
typedef NSMutableDictionary<ZMCEmptyDataState, UIImage*> ZMPImageDictionary;
typedef NSMutableDictionary<ZMCEmptyDataState, NSAttributedString*> ZMPTitleDictionary;

@interface ZMCEmptyDataManager()<DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

@property (nonatomic, strong) ZMPActionHandlerDictionary    *actionHandlerDicts;

@property (nonatomic, strong) ZMPImageDictionary            *stateImageDicts;

@property (nonatomic, strong) ZMPTitleDictionary            *stateTitleDicts;

@end


@implementation ZMCEmptyDataManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _state = ZMCEmptyDataStateNormal;
    }
    return self;
}

#pragma mark - Getter/Setter

- (ZMPActionHandlerDictionary *)actionHandlerDicts {
    if (!_actionHandlerDicts) {
        _actionHandlerDicts = [NSMutableDictionary dictionary];
    }
    return _actionHandlerDicts;
}

- (ZMPImageDictionary *)stateImageDicts {
    if (!_stateImageDicts) {
        _stateImageDicts = [NSMutableDictionary dictionary];
    }
    return _stateImageDicts;
}

- (ZMPTitleDictionary *)stateTitleDicts {
    if (!_stateTitleDicts) {
        _stateTitleDicts = [NSMutableDictionary dictionary];
    }
    return _stateTitleDicts;
}

- (void)setState:(ZMCEmptyDataState)state {
    _state = state;

    self.scrollView.contentOffset = CGPointZero;
}

- (BOOL)isEmpty {
    return ![self.state isEqualToString:ZMCEmptyDataStateNormal];
}

+ (NSAttributedString *)attributedStringWithTitle:(NSString *)title {
    if (title.length == 0) {
        return nil;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:15.0f];
    attributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.stateImageDicts[self.state];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return self.stateTitleDicts[self.state];
}

#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView {
    return (self.state != ZMCEmptyDataStateNormal);
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return self.allowScrollWhenEmptyData;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return 0;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -110;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor whiteColor];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    ZMCEmptyDataStateActionHandler handler = self.actionHandlerDicts[self.state];
    if (handler) {
        [scrollView zmc_idle];
        handler(scrollView);
    }
}

@end

//_________________________________________________________________________________


ZMCEmptyDataState const ZMCEmptyDataStateNormal = @"state.normal";
ZMCEmptyDataState const ZMCEmptyDataStateNoData = @"state.noData";
ZMCEmptyDataState const ZMCEmptyDataStateNetworkDisabled = @"state.networkDiabled";
ZMCEmptyDataState const ZMCEmptyDataStateDynamic = @"state.dynamic";

NSString *const ZMCEmptyDataNoDataText          = @"暂无数据";
NSString *const ZMCEmptyDataNetworkDisableText  = @"网络正在开小差，点击刷新";

static char zmc_emptyDataManagerKey;

@interface UIScrollView()


@end

@implementation UIScrollView (ZMCScrollViewState)

#pragma mark - Getter / Setter

- (ZMCEmptyDataManager *)zmc_emptyDataMnager {
    ZMCEmptyDataManager *manager = objc_getAssociatedObject(self, &zmc_emptyDataManagerKey);
    if (!manager) {
        manager = [ZMCEmptyDataManager new];
        manager.scrollView = self;
        self.zmc_emptyDataMnager = manager;
    }

    return manager;
}

- (void)setZmc_emptyDataMnager:(ZMCEmptyDataManager *)zmc_emptyDataMnager {
    objc_setAssociatedObject(self, &zmc_emptyDataManagerKey, zmc_emptyDataMnager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - RegisterState

- (void)zmc_registerState:(ZMCEmptyDataState)state
                title:(NSString *)title
      backgroundImage:(UIImage *)image
   usingActionHandler:(ZMCEmptyDataStateActionHandler)actionHandler
{

    [self zmc_registerState:state
            attributesTitle:[ZMCEmptyDataManager attributedStringWithTitle:title]
            backgroundImage:image
         usingActionHandler:actionHandler];
}

- (void)zmc_registerState:(ZMCEmptyDataState)state
      attributesTitle:(NSAttributedString *)title
      backgroundImage:(UIImage *)image
   usingActionHandler:(ZMCEmptyDataStateActionHandler)actionHandler
{
    self.emptyDataSetSource = self.zmc_emptyDataMnager;
    self.emptyDataSetDelegate = self.zmc_emptyDataMnager;

    self.zmc_emptyDataMnager.stateTitleDicts[state] = title;
    self.zmc_emptyDataMnager.stateImageDicts[state] = image;
    self.zmc_emptyDataMnager.actionHandlerDicts[state] = actionHandler;
}

- (void)zmc_setTitle:(nullable NSString *)title forEmptyState:(ZMCEmptyDataState)state {
    NSAttributedString *attributedTitle = [ZMCEmptyDataManager attributedStringWithTitle:title];
    [self zmc_setAttributedTitle:attributedTitle forEmptyState:state];
}

- (void)zmc_setAttributedTitle:(nullable NSAttributedString *)attributedTitle forEmptyState:(ZMCEmptyDataState)state {
    NSParameterAssert(state || ![state isEqualToString:ZMCEmptyDataStateNormal]);
    self.zmc_emptyDataMnager.stateTitleDicts[state] = attributedTitle;
}

- (void)zmc_setBackgroundImage:(nullable UIImage *)image forEmptyState:(ZMCEmptyDataState)state {
    NSParameterAssert(state || ![state isEqualToString:ZMCEmptyDataStateNormal]);
    self.zmc_emptyDataMnager.stateImageDicts[state] = image;
}

- (void)zmc_setActionHandler:(nullable ZMCEmptyDataStateActionHandler)handler forEmptyState:(ZMCEmptyDataState)state {
    NSParameterAssert(state || ![state isEqualToString:ZMCEmptyDataStateNormal]);
    self.zmc_emptyDataMnager.actionHandlerDicts[state] = handler;
}

#pragma mark - ZMParentsApp

- (void)zmc_registerEmptyAndNetworkDisabledWithActionHandler:(ZMCEmptyDataStateActionHandler)actionHandler {
    [self zmc_setEmptyDataWithActionHandler:actionHandler];
    [self zmc_setNetworkUnavailableWithActionHandler:actionHandler];
}

- (void)zmc_setEmptyDataWithActionHandler:(ZMCEmptyDataStateActionHandler)actionHandler {
    [self zmc_registerState:ZMCEmptyDataStateNoData
                  title:ZMCEmptyDataNoDataText
        backgroundImage:[UIImage imageNamed:@"register_bg_wushuju"]
     usingActionHandler:actionHandler];
}

- (void)zmc_setNetworkUnavailableWithActionHandler:(ZMCEmptyDataStateActionHandler)actionHandler {
    [self zmc_registerState:ZMCEmptyDataStateNetworkDisabled
                  title:ZMCEmptyDataNetworkDisableText
        backgroundImage:[UIImage imageNamed:@"register_bg_load"]
     usingActionHandler:actionHandler];
}

#pragma mark - Public

- (void)zmc_idle {
    self.zmc_emptyDataMnager.state = ZMCEmptyDataStateNormal;
    [self reloadEmptyDataSet];
}

- (void)zmc_emptyData {
    self.zmc_emptyDataMnager.state = ZMCEmptyDataStateNoData;
    [self reloadEmptyDataSet];
}

- (void)zmc_networkDisabled {
    self.zmc_emptyDataMnager.state = ZMCEmptyDataStateNetworkDisabled;
    [self reloadEmptyDataSet];
}

- (void)zmc_dynamicMode {
    self.zmc_emptyDataMnager.state = ZMCEmptyDataStateDynamic;
    [self reloadEmptyDataSet];
}

@end
