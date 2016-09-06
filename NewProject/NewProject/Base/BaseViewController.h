//
//  BaseViewController.h
//  AXT_Personal
//
//  Created by Power on 15/2/6.
//  Copyright (c) 2015年 淮安微赢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)addNavigationLeftView:(NSString *)title andType:(int)type;
- (void)addNavigationMiddleView:(NSString *)title;
- (void)addNavigationRightView:(NSString *)title;

@end
