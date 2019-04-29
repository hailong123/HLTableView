//
//  HLBaseTableViewController+EmptyProtocl.h
//  AFNetworking
//
//  Created by SeaDragon on 2018/12/25.
//

#import "HLBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLBaseTableViewController (EmptyProtocl)

- (UIFont *)normalFontWithoutNetwork:(BOOL)network;
- (NSString *)normalDesWithoutNetwork:(BOOL)network;
- (UIColor *)normalColorWithoutNetwork:(BOOL)network;
- (NSString *)normalImageNamedWithoutNetwork:(BOOL)network;

@end

NS_ASSUME_NONNULL_END
