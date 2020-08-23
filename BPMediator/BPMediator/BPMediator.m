//
//  BPMediator.m
//  BPMediator
//
//  Created by iDog on 2020/8/23.
//  Copyright © 2020 iDog. All rights reserved.
//

#import "BPMediator.h"

@implementation BPMediator

//MARK: Target Action

/**
 - 硬编码
 - 该类容易臃肿<可以用分类做拆分>
 - performSelector 方法传参有限
*/

/**
 - 抽离业务逻辑
 - 通过中间层进行调用
 - 中间层使用Runtime反射
 */

+ (__kindof UIViewController *)twoViewControllerWithParam:(NSString *)param {
    
    
    Class twoCls = NSClassFromString(@"TwoViewController");
    UIViewController *controller = [[twoCls alloc] performSelector:NSSelectorFromString(@"initWithParam:") withObject:param];
    return controller;
    
}

//MARK: URL Scheme

/**
 - 具体参数不透明
 - 非懒加载
 - 注册表的维护
*/

/**
 - 使用URL处理本地的跳转
 - 通过中间层进行注册和调用
 - 注册表无需使用反射
*/

+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionary];
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(BPMediatorProgressBlock)processBlock {
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params {

    /**
     url 可携带额外参数 此时取scheme作为key 当前简便实用url为key
     */
    BPMediatorProgressBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}


//MARK: Protocol Class

/**
 - 增加 Protocol Wrapper 层
 - 中间件返回 Protocol 对应的 Class
 - 解决硬编码的问题
*/

+ (void)registerProtocol:(Protocol *) protocol cls:(Class)cls {
    if (protocol && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(protocol)];
    }
}

+ (Class)classForProtocol:(Protocol *) protocol {
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(protocol)];
}

@end
