//
//  NSObject+MutableTarget.h
//  HLTableView
//
//  Created by SeaDragon on 2018/5/14.
//

#import <Foundation/Foundation.h>

@interface NSObject (MutableTarget)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;

@end
