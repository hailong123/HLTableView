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

typedef NS_ENUM(NSUInteger, HLEmptyTableManagerState) {
    HLEmptyTableManagerStateDefault = 0, //默认状态,
    HLEmptyTableManagerStateNoNetwork,   //无网状态
    HLEmptyTableManagerStateNoData,      //无数据状态
};

@protocol HLEmptyTableManagerDelegate <NSObject>

- (void)touchEmptyTableManager:(HLEmptyTableManager *)emptyTableManager;

@end

@interface HLEmptyTableManager : NSObject
<
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate
>

@property (nonatomic, weak) UITableView *tableView;

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

//自定义空视图(设置自定义视图之后,自定义配置则不可使用)
@property (nonatomic, strong) UIView *customView;

//空数据显示状态
@property (nonatomic, assign) HLEmptyTableManagerState emptyState;

@property (nonatomic, weak) id <HLEmptyTableManagerDelegate> emptyManagerDelegate;

+ (instancetype)shareInstance;

@end

@interface UITableView (EmptyDataSet)

@property (nonatomic, strong) HLEmptyTableManager *emptyManager;

/*
 刷新空图状态
 */
- (void)refreshEmptyData;

//获取当前状态
- (HLEmptyTableManagerState)hl_emptyTableManagerState;

/*
 配置空图类型为按钮类型
 
 @param image       图片
 @param title       文字 不显示文字则此字段传 nil
 @param attributes  文字的样式
 */
- (void)configurationWithImageNamed:(NSString *)imageNamed
                              title:(nullable NSString *)title
                         attributes:(nullable NSDictionary<NSAttributedStringKey,id> *)attributes
                        description:(nullable NSString *)des
                      desAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)desAttributes
                              state:(HLEmptyTableManagerState)emptyState;


/*
 配置空图的颜色
 
 @param backgroundColor  背景颜色
 @param imageTintColor   图片颜色
 */
- (void)configurationBackgroundColor:(UIColor *)backgroundColor
                               state:(HLEmptyTableManagerState)emptyState;

/*
 配置空图类型为文字类型  (不可点击)
 
 @param title           标题
 @param titleAttributes 标题样式
 @param des             描述
 @param desAttributes   描述样式
 
 */
- (void)configurationWithTitle:(nullable NSString *)title
               titleAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)titleAttributes
                   description:(nullable NSString *)des
                 desAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)desAttributes
                         state:(HLEmptyTableManagerState)emptyState;

@end

NS_ASSUME_NONNULL_END
