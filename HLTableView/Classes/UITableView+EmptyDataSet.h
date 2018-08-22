//
//  UITableView+EmptyDataSet.h
//  AFNetworking
//
//  Created by SeaDragon on 2018/8/21.
//

#import <UIKit/UIKit.h>

#import "UIScrollView+EmptyDataSet.h"

NS_ASSUME_NONNULL_BEGIN

@class HLEmptyTableManager;

@protocol HLEmptyTableManagerDelegate <NSObject>

- (void)touchEmptyTableManager:(HLEmptyTableManager *)emptyTableManager;

@end

@interface HLEmptyTableManager : NSObject
<
    DZNEmptyDataSetSource,
    DZNEmptyDataSetDelegate
>

@property (nonatomic, strong) UITableView *tableView;

/*
     设置此参数, 可设置控件之间的间隔
 */
@property (nonatomic, assign) CGFloat spaceHeight;

/*
    设置此参数, 可设置控件垂直的偏移量
 */
@property (nonatomic, assign) CGFloat verticalOffset;

/*
    是否允许空图可点击
 */
@property (nonatomic, assign, getter=isAllowTouch)  BOOL allowTouch;

/*
    是否允许空图可滚动
 */
@property (nonatomic, assign, getter=isAllowScroll) BOOL allowScroll;

@property (nonatomic, weak) id <HLEmptyTableManagerDelegate> emptyManagerDelegate;

+ (instancetype)shareInstance;

@end

@interface UITableView (EmptyDataSet)

@property (nonatomic, strong) HLEmptyTableManager *emptyManager;

/*
    刷新空图状态
 */
- (void)refreshEmptyData;

/*
    配置空图的图片
 
    @param image
 */
- (void)configurationWithImage:(UIImage *)image;


/*
    配置空图的颜色
 
    @param backgroundColor  背景颜色
    @param imageTintColor   图片颜色
 */
- (void)configurationBackgroundColor:(UIColor *)backgroundColor;

/*
    配置空图类型为文字类型  (不可点击)
 
    @param title 标题
    @param des   描述

 */
- (void)configurationWithTitle:(nullable NSString *)title
                   description:(nullable NSString *)des;


/*
    配置空图为按钮类型 (可点击)
 
    @param buttonTitle      标题
    @param buttonImage      图片
    @param backgroundImage  背景图
    @param state            类型状态
 */
- (void)configurationWithButtonTitle:(nullable NSString *)buttonTitle
                         buttonImage:(UIImage *)buttonImage
                     backgroundImage:(UIImage *)backgroundImage
                        controlState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
