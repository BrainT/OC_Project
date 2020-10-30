//
//  NSArray+AvoidCrash.m
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/30.
//  Copyright © 2020 tl. All rights reserved.
//

#import "NSArray+AvoidCrash.h"
#import "TLRuntimeTool.h"
#import <objc/runtime.h>
@implementation NSArray (AvoidCrash)
+ (void)load
{
        /** 保证执行一次交换
         *  定义一个Runtime工具类，在其中实现交换
         * animalInstanceMethod：原始待替换方法
         * smallCatInstanceMethod：替换之后的方法
         */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [TLRuntimeTool runtimeMethodSwizzlingWithClass:NSClassFromString(@"__NSArrayI")
                                             originSEL:@selector(objectAtIndex:)
                                          swizzlingSEL:@selector(avoidCrashObjectsAtIndexes:)];

    });
}

//__NSArrayI  objectAtIndex:
- (id)avoidCrashObjectsAtIndexes:(NSUInteger)index {
    
#ifdef DEBUG  // 开发模式
       return  [self avoidCrashObjectsAtIndexes:index];
#else // 发布模式
    id object = nil;
    @try {
       object = [self avoidCrashObjectsAtIndexes:index];
   }
   @catch (NSException *exception) {
       // 捕捉到的错误
       
       NSLog(@"** Exception class :%s ** Exception Method: %s \n", class_getName(self.class), __func__);
       
       NSLog(@"Uncaught exception description: %@", exception);
       
       NSLog(@"%@", [exception callStackSymbols]);
       
   }
   @finally {
       return object;
   }
#endif
}
@end
