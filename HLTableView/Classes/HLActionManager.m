//
//  HLActionManager.m
//  HLTableView
//
//  Created by SeaDragon on 2018/5/5.
//

#import "HLActionManager.h"

@implementation HLActionManager

+ (instancetype)shareActionManager {
    
    static dispatch_once_t onceToken;
    static HLActionManager *_instance;
    
    dispatch_once(&onceToken, ^{
        _instance = [[[self class] alloc] init];
    });
    
    return _instance;
}

- (NSMutableDictionary<NSString *,HLActionItem *> *)actionDictionary {
    
    if (!_actionDictionary) {
        _actionDictionary = [NSMutableDictionary dictionary];
    }
    
    return _actionDictionary;
}

@end
