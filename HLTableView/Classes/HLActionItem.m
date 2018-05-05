//
//  HLActionItem.m
//  HLTableView
//
//  Created by SeaDragon on 2018/5/5.
//

#import "HLActionItem.h"

@implementation HLActionItem

- (instancetype)initWithActionItemWithTarget:(id)target action:(SEL)action {
    
    if (self = [super init]) {
        _target = target;
        _action = action;
    }
    
    return self;
}

@end
