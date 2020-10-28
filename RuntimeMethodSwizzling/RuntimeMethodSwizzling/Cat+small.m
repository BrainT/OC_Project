//
//  Cat+small.m
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/28.
//  Copyright © 2020 tl. All rights reserved.
//

#import "Cat+small.h"
#import "TLRuntimeTool.h"

@implementation Cat (small)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [TLRuntimeTool runtimeMethodSwizzlingWithClass:self originSEL:@selector(animalInstanceMethod) swizzlingSEL:@selector(smallCatInstanceMethod)];
    });
}

- (void)smallCatInstanceMethod
{
    NSLog(@"给 small cat 分类添加了实例方法：%s",__func__);
    [self smallCatInstanceMethod];
    
}

@end
