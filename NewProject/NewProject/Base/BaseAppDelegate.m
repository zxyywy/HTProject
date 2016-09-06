//
//  BaseAppDelegate.m
//  NewProject
//
//  Created by 创维海通 on 16/9/5.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "BaseAppDelegate.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation BaseAppDelegate

-(BOOL)respondsToSelector:(SEL)aSelector
{
    BOOL canResponse = [self methodForSelector:aSelector] != nil && [self methodForSelector:aSelector] != _objc_msgForward;
    
    if (! canResponse && [[self appDelegateMethods] containsObject:NSStringFromSelector(aSelector)]) {
        canResponse = [[HTAppServiceManager sharedManager] proxyCanResponseToSelector:aSelector];
    }
    return canResponse;
}

- (NSArray<NSString *> *)appDelegateMethods {
    static NSMutableArray *methods = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned int methodCount = 0;
        
        //获取协议中指定条件的方法的方法描述数组
        struct objc_method_description *methodList = protocol_copyMethodDescriptionList(@protocol(UIApplicationDelegate), NO, YES, &methodCount);
        
        //初始化可变数组对象的长度,初始为0
        methods = [NSMutableArray arrayWithCapacity:methodCount];
        
        for (int i = 0; i < methodCount; i ++) {
            struct objc_method_description md = methodList[i];
            //得到SEL类型的方法名
            [methods addObject:NSStringFromSelector(md.name)];
        }
        //手动释放
        free(methodList);
    });
    return methods;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [[HTAppServiceManager sharedManager] proxyForwardInvocation:anInvocation];
}

@end
