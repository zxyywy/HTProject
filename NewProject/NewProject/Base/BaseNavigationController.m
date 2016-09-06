//
//  BaseNavigationController.m
//  NewProject
//
//  Created by 创维海通 on 16/9/5.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak BaseNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])  {
        self.interactivePopGestureRecognizer.delegate = (id)weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //这个方法是在当前控制器执行push的时候，禁止手势右划返回，避免出现crash的现象，（也可以不实现好像也没什么影响）
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    //判断上一个控制器和现在的控制器是不是同一个，如果是，返回。如果不是push到当前控制器，这就有效避免了同一个控制器连续push的问题
    if ([self.topViewController isMemberOfClass:[viewController class]]) {
        return;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
