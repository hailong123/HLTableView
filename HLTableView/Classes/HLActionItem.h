//
//  HLActionItem.h
//  HLTableView
//
//  Created by SeaDragon on 2018/5/5.
//事件模型

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLActionItem : NSObject

@property (nonatomic, readonly) SEL action;
@property (nonatomic, strong, readonly) id target;

- (instancetype)initWithActionItemWithTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
