//
//  NSObject+MutableTarget.m
//  HLTableView
//
//  Created by SeaDragon on 2018/5/14.
//

#import "NSObject+MutableTarget.h"

@implementation NSObject (MutableTarget)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects {
    
    NSMethodSignature *methodSignature = [[self class] instanceMethodSignatureForSelector:aSelector];
    
    if(methodSignature == nil) {
        @throw [NSException exceptionWithName:@"抛异常错误" reason:@"没有这个方法，或者方法名字错误" userInfo:nil];
        return nil;
    } else {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        [invocation setTarget:self];
        [invocation setSelector:aSelector];
        //签名中方法参数的个数，内部包含了self和_cmd，所以参数从第3个开始
        NSInteger  signatureParamCount = methodSignature.numberOfArguments - 2;
        NSInteger requireParamCount    = objects.count;
        NSInteger resultParamCount     = MIN(signatureParamCount, requireParamCount);
        
        for (NSInteger i = 0; i < resultParamCount; i++) {
            id  obj = objects[i];
            [invocation setArgument:&obj atIndex:i+2];
        }
        
        [invocation invoke];
        //返回值处理
        id callBackObject = nil;
        
        if(methodSignature.methodReturnLength) {
            [invocation getReturnValue:&callBackObject];
        }
        
        return callBackObject;
    }
}

@end
