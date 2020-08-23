//
//  BPMediator.h
//  BPMediator
//
//  Created by iDog on 2020/8/23.
//  Copyright © 2020 iDog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol BPTwoViewControllerProtocol <NSObject>

- (__kindof UIViewController *)twoViewControllerWithParam:(NSString *)param;

@end

@interface BPMediator : NSObject

// Target Action
+ (__kindof UIViewController *)twoViewControllerWithParam:(NSString *)param;

// URL Scheme
typedef void(^BPMediatorProgressBlock)(NSDictionary *param);
+ (void)registerScheme:(NSString *)scheme processBlock:(BPMediatorProgressBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSString *)params;

// Protocol Class
+ (void)registerProtocol:(Protocol *)protocol cls:(Class)cls;
+ (Class)classForProtocol:(Protocol *)protocol;
@end

NS_ASSUME_NONNULL_END
