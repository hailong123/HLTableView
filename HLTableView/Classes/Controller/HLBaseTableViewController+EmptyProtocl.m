//
//  HLBaseTableViewController+EmptyProtocl.m
//  AFNetworking
//
//  Created by SeaDragon on 2018/12/25.
//

#import "HLBaseTableViewController+EmptyProtocl.h"

static NSString const *kNoDataDes    = @"暂无数据";
static NSString const *kNoNetworkDes = @"暂无网络";

static CGFloat const kNoDataFontSize    = 15;
static CGFloat const kNoNetworkFontSize = 15;

@implementation HLBaseTableViewController (EmptyProtocl)
//默认设置
- (NSString *)normalDesWithoutNetwork:(BOOL)network {
    if (network) {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noNetworkDes)]) {
            return [self.emptySourceDelegate noNetworkDes];
        }
        
        return kNoNetworkDes;
    } else {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noDataDes)]) {
            return [self.emptySourceDelegate noDataDes];
        }
        
        return kNoDataDes;
    }
}

- (UIFont *)normalFontWithoutNetwork:(BOOL)network {
    if (network) {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noNetworkFontSize)]) {
            return [self.emptySourceDelegate noNetworkFontSize];
        }
        
        return [UIFont systemFontOfSize:kNoNetworkFontSize];
    } else {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noDataFontSize)]) {
            return [self.emptySourceDelegate noDataFontSize];
        }
        
        return [UIFont systemFontOfSize:kNoDataFontSize];;
    }
}

- (UIColor *)normalColorWithoutNetwork:(BOOL)network {
    if (network) {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noNetowrkDesColor)]) {
            return [self.emptySourceDelegate noNetowrkDesColor];
        }
        
        return [UIColor grayColor];
    } else {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noDatakDesColor)]) {
            return [self.emptySourceDelegate noDatakDesColor];
        }
        
        return  [UIColor grayColor];
    }
}

- (NSString *)normalImageNamedWithoutNetwork:(BOOL)network {
    if (network) {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noNetworkImageNamed)]) {
            return [self.emptySourceDelegate noNetworkImageNamed];
        }
        
        return @" ";
    } else {
        if (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:@selector(noDataImageNamed)]) {
            return [self.emptySourceDelegate noDataImageNamed];
        }
        
        return @" ";
    }
}
@end
