//
//  OneViewController.m
//  BPMediator
//
//  Created by iDog on 2020/8/23.
//  Copyright © 2020 iDog. All rights reserved.
//

#import "OneViewController.h"
#import "BPMediator.h"
@interface OneViewController ()

@end

@implementation OneViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.orangeColor;
    button.frame = CGRectMake(150, 300, 80, 60);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClicked:(UIButton *) sender {
//    [self.navigationController pushViewController:[BPMediator twoViewControllerWithParam:@"Target Action"] animated:YES];
    
//    [BPMediator openUrl:@"twoController://" params:@{@"controller":self.navigationController,@"param":@"URL Scheme"}];
    
    Class cls = [BPMediator classForProtocol:@protocol(BPTwoViewControllerProtocol)];
    [self.navigationController pushViewController:[[cls alloc] twoViewControllerWithParam:@"Protocol Class"] animated:YES];

    
}

@end
