//
//  HLBaseTableViewController+EmptyProtocl.h
//  AFNetworking
//
//  Created by SeaDragon on 2018/12/25.
//

#import "HLBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLBaseTableViewController (EmptyProtocl)

- (UIFont *)desFontConfigWithoutNetwork:(BOOL)network;
- (UIFont *)titleFontConfigWithoutNetwork:(BOOL)network;

- (NSString *)desConfigWithoutNetwork:(BOOL)network;
- (NSString *)titleConfigWithoutNetwork:(BOOL)network;

- (NSString *)imageNamedConfigWithoutNetwork:(BOOL)network;

- (UIColor *)desColorConfigWithoutNetwork:(BOOL)network;
- (UIColor *)titleColorConfigWithoutNetwork:(BOOL)network;


@end

NS_ASSUME_NONNULL_END
