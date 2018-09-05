//
//  HLCustomTableViewHeaderFooterView.h
//  HLTableView
//
//  Created by SeaDragon on 2018/8/28.
//自定义头尾部视图

#import <UIKit/UIKit.h>

#import "HLCellHeaderAndFooterDataAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@class HLCustomTableViewHeaderFooterView;

@protocol HLCustomTableViewHeaderFooterViewDelegate <NSObject>

- (void)customTableViewHeaderFooterView:(HLCustomTableViewHeaderFooterView *)customTableViewHeaderFooterView
                                   data:(id)data;

@end

@interface HLCustomTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nullable ,nonatomic, weak) id data;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *currentController;

@property (nonatomic, weak) HLCellHeaderAndFooterDataAdapter *dataAdapter;

@property (nullable ,nonatomic, weak) id <HLCustomTableViewHeaderFooterViewDelegate> delegate;

#pragma mark

- (void)setHeaderFooterViewBackgroundColor:(UIColor *)backgroundColor;

- (void)setupHeaderFooterView;

- (void)buildSubview;

- (void)loadContent;

+ (CGFloat)heightWithData:(nullable id)data;

@end

NS_ASSUME_NONNULL_END
