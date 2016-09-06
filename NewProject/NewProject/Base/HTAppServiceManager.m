//
//  HTAppServiceManager.m
//  NewProject
//
//  Created by 创维海通 on 16/9/5.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "HTAppServiceManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface HTAppServiceManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString*, id<BaseAppService>> *servicesMap;
@end

@implementation HTAppServiceManager

@end
