//
//  BaseViewController.m
//  AXT_Personal
//
//  Created by Power on 15/2/6.
//  Copyright (c) 2015年 淮安微赢. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, assign) int popType;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = rgb(238, 238, 238, 1.0);

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addNavigationLeftView:(NSString *)title andType:(int)type {
    self.popType = type;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = YES;
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, (44-25)/2, 12, 25)];
    backImage.backgroundColor = [UIColor clearColor];
    backImage.contentMode = UIViewContentModeScaleToFill;
    backImage.image = [UIImage imageNamed:@"mall16"];
    [leftView addSubview:backImage];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction:)];
    [leftView addGestureRecognizer:tap];
}

- (void)addNavigationMiddleView:(NSString *)title {
    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 140, 44)];
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor=[UIColor blackColor];
    [titleText setFont:[UIFont systemFontOfSize:18.0]];
    [titleText setText:title];
    titleText.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=titleText;
}

- (void)addNavigationRightView:(NSString *)title {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.text = title;
    label.textAlignment = NSTextAlignmentRight;
    label.userInteractionEnabled = YES;
   
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:label];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTapAction)];
    [label addGestureRecognizer:rightTap];
}

- (IBAction)backAction:(UITapGestureRecognizer *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (self.popType == 0) {
        [[ManagerVC sharedManagerVC] showTabBar];
    }
}

- (void)rightTapAction {
    NSLog(@"导航栏右边视图点击");
}

@end
