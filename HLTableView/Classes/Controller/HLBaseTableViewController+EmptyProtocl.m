//
//  HLBaseTableViewController+EmptyProtocl.m
//  AFNetworking
//
//  Created by SeaDragon on 2018/12/25.
//

#import "HLBaseTableViewController+EmptyProtocl.h"

static NSString * kNoDataDes    = @"暂无数据";
static NSString * kNoNetworkDes = @"暂无网络";

static CGFloat const kNoDataFontSize    = 15;
static CGFloat const kNoNetworkFontSize = 15;

@implementation HLBaseTableViewController (EmptyProtocl)

- (UIFont *)desFontConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorDesFontKey];
        }
        return [UIFont systemFontOfSize:kNoNetworkFontSize];
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataDesFontKey];
        }
        return [UIFont systemFontOfSize:kNoDataFontSize];;
    }
}

- (UIFont *)titleFontConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorTitleFontKey];
        }
        return [UIFont systemFontOfSize:kNoNetworkFontSize];
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataTitleFontKey];
        }
        return [UIFont systemFontOfSize:kNoDataFontSize];;
    }
}


//默认设置
- (NSString *)desConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorDesKey];
        }
        
        return kNoNetworkDes;
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataDesKey];
        }
        
        return kNoDataDes;
    }
}

- (NSString *)titleConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorTitleKey];
        }
        
        return kNoNetworkDes;
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataTitleKey];
        }
        
        return kNoDataDes;
    }
}

- (NSString *)imageNamedConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorImageNamedKey];
        }
        
        return @"default_pic";
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataImageNamedKey];
        }
        
        return @"default_pic";
    }
}

- (UIColor *)desColorConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorDesColorKey];
        }
        
        return [UIColor grayColor];
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataDesColorKey];
        }
        
        return  [UIColor grayColor];
    }
}

- (UIColor *)titleColorConfigWithoutNetwork:(BOOL)network {
    if (network) {
        if ([self respondsSelector:@selector(networkErrorConfiguration)]) {
            return [self.emptySourceDelegate networkErrorConfiguration][NetworkErrorTitleColorKey];
        }
        
        return [UIColor grayColor];
    } else {
        if ([self respondsSelector:@selector(nodataConfiguration)]) {
            return [self.emptySourceDelegate nodataConfiguration][NoDataTitleColorKey];
        }
        
        return  [UIColor grayColor];
    }
}

- (BOOL)respondsSelector:(SEL)selector {
    return (self.emptySourceDelegate && [self.emptySourceDelegate respondsToSelector:selector]);
}

@end
