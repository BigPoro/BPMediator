//
//  TwoViewController.m
//  BPMediator
//
//  Created by iDog on 2020/8/23.
//  Copyright © 2020 iDog. All rights reserved.
//

#import "TwoViewController.h"
#import "BPMediator.h"

@interface TwoViewController ()<BPTwoViewControllerProtocol>
@property (nonatomic, copy) NSString *param;

@end

@implementation TwoViewController

+ (void)load {
    // URL Scheme
//    [BPMediator registerScheme:@"twoController://" processBlock:^(NSDictionary * _Nonnull params) {
//        NSString *param = [params objectForKey:@"param"];
//        UINavigationController *nav = (UINavigationController *)[params objectForKey:@"controller"];
//        TwoViewController *controller = [[TwoViewController alloc] initWithParam:param];
//        [nav pushViewController:controller animated:YES];
//    }];
    
    // Protocol Class
    [BPMediator registerProtocol:@protocol(BPTwoViewControllerProtocol) cls:[self class]];
    
}

// BPTwoViewControllerProtocol
- (__kindof UIViewController *)twoViewControllerWithParam:(NSString *)param {
    return [self initWithParam:param];
}

- (instancetype)initWithParam:(NSString *)param {
    if (self = [super init]) {
        self.param = param;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;

    UILabel *label = [UILabel new];
    label.text = self.param;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColor.whiteColor;
    label.backgroundColor = UIColor.orangeColor;
    label.frame = CGRectMake(150, 300, 120, 60);
    [self.view addSubview:label];
}




@end
