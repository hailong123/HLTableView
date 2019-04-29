//
//  HLCellHeaderAndFooterDataAdapter.h
//  HLTableView
//
//  Created by SeaDragon on 2018/8/28.
//头视图 和 底部视图 模型

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AdapterHeightType) {
    AdapterHeightTypeAll      = 0, //头部和尾部高度一致
    AdapterHeightTypeFooter   = 1, //设置尾部高度
    AdapterHeightTypeHeader   = 2, //设置头部高度
    AdapterHeightTypeDefault  = 3  //默认 高度为0
};

NS_ASSUME_NONNULL_BEGIN

@interface HLCellHeaderAndFooterDataAdapter : NSObject

//注册头尾视图的标识
@property (nonatomic, copy) NSString *reuseIdentifier;

//设置 接收时间的代理 用于处理事件
@property (nonatomic, weak) id dataAdapterDelegate;

//头尾视图的数据
@property (nullable ,nonatomic, strong) id data;

//头部高度
@property (nonatomic, assign) CGFloat headerHeight;
//尾部高度
@property (nonatomic, assign) CGFloat footerHeight;

//是否是 多section 类型
@property (nonatomic, strong) NSMutableArray<HLCellHeaderAndFooterDataAdapter*> *sectionArray;

//索引
@property (nonatomic, assign) NSInteger section;

//设置高度的类型
@property (nonatomic, assign) AdapterHeightType type;

/*
    实例化数据模型,通过此模型可对UITableView的头尾视图进行配置显示
 
    @param identifier  唯一标示符
    @param delegate    视图代理
    @param height      视图高度
    @param data        填充的数据
    @param type        表头的类型
 
    @return HLCellHeaderAndFooterDataAdapter
 */

+ (HLCellHeaderAndFooterDataAdapter *)cellHeaderAndFooterDataAdapterWithIdentifier:(NSString *)identifier
                                                                          delegate:(nullable id)delegate
                                                                            height:(CGFloat)height
                                                                              data:(nullable id)data
                                                                              type:(AdapterHeightType)type;

/*
 @param adapterArray 装在多section的CellDataAdapter模型
 @return HLCellDataAdapter  cell绑定的模型
 */

+ (HLCellHeaderAndFooterDataAdapter *)cellHeaderAndFooterDataAdapterWithAdapterArray:(NSArray <HLCellHeaderAndFooterDataAdapter *>*)adapterArray;

@end

NS_ASSUME_NONNULL_END
