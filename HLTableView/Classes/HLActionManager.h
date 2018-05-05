//
//  HLActionManager.h
//  HLTableView
//
//  Created by SeaDragon on 2018/5/5.
//事件的管理类

#import <Foundation/Foundation.h>

@class HLActionItem;

NS_ASSUME_NONNULL_BEGIN

@interface HLActionManager : NSObject

+ (instancetype)shareActionManager;

@property (nonatomic, strong) NSMutableDictionary <NSString *, HLActionItem *> *actionDictionary;

@end

NS_ASSUME_NONNULL_END
