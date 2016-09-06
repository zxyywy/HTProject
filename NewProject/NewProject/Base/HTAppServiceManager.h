//
//  HTAppServiceManager.h
//  NewProject
//
//  Created by 创维海通 on 16/9/5.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ML_EXPORT_SERVICE(name) \
+ (void)load {[[MLAppServiceManager sharedManager] registerService:[self new]];} \
- (NSString *)serviceName { return @#name; }

NS_ASSUME_NONNULL_BEGIN
@protocol BaseAppService <UIApplicationDelegate>
@required
- (NSString *)serviceName;

@end

@interface HTAppServiceManager : NSObject<NSCopying>

+ (instancetype)sharedManager;

//注册服务
- (void)registerService:(id<BaseAppService>)service;
//代理
- (BOOL)proxyCanResponseToSelector:(SEL)aSelector;
- (void)proxyForwardInvocation:(NSInvocation *)anInvocation;

@end

NS_ASSUME_NONNULL_END