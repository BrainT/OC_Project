//
//  TLRuntimeTool.m
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/28.
//  Copyright © 2020 tl. All rights reserved.
//

#import "TLRuntimeTool.h"
#import <objc/runtime.h>

@implementation TLRuntimeTool


+(void)runtimeClassMethodSwizzlingWithClass:(Class)targetCls originSEL:(SEL)oriSel swizzlingSEL:(SEL)swizzlingSel
{
    if (!targetCls) {
        NSLog(@"传入的类不能为空");
        return;
    }
    
    Method originMethod = class_getClassMethod(targetCls, oriSel);
    Method swizzlingMethod = class_getClassMethod(targetCls, swizzlingSel);
    
    if (!originMethod) {
        // 在oriMethod为nil时，替换后将swizzledSEL复制一个不做任何事的空实现,代码如下:
        class_addMethod(targetCls, oriSel, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
        method_setImplementation(swizzlingMethod, imp_implementationWithBlock(^(id self, SEL _cmd){ }));
    }
    
    BOOL swizzlingResult = class_addMethod(targetCls,
                                           oriSel,
                                           method_getImplementation(swizzlingMethod),
                                           method_getTypeEncoding(originMethod));
    /**
     * 判断是否能添加成功;如果成功，表明对象类没有方法，重写一个实现方法
     */
    if (swizzlingResult) {
        class_replaceMethod(targetCls,
                            swizzlingSel,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
    }else{
        // 原有类有实现方法
        method_exchangeImplementations(originMethod, swizzlingMethod);
    }
}


+(void)runtimeMethodSwizzlingWithClass:(Class)targetCls originSEL:(SEL)oriSel swizzlingSEL:(SEL)swizzlingSel
{
    if (!targetCls) {
        NSLog(@"传入的类不能为空");
        return;
    }
    
    Method originMethod = class_getInstanceMethod(targetCls, oriSel);
    Method swizzlingMethod = class_getInstanceMethod(targetCls, swizzlingSel);
    
    if (!originMethod) {
        // 在oriMethod为nil时，替换后将swizzledSEL复制一个不做任何事的空实现,代码如下:
        class_addMethod(targetCls, oriSel, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
        method_setImplementation(swizzlingMethod, imp_implementationWithBlock(^(id self, SEL _cmd){ }));
    }
    
    BOOL swizzlingResult = class_addMethod(targetCls,
                                           oriSel,
                                           method_getImplementation(swizzlingMethod),
                                           method_getTypeEncoding(originMethod));
    /**
     * 判断是否能添加成功;如果成功，表明对象类没有方法，重写一个实现方法
     */
    if (swizzlingResult) {
        class_replaceMethod(targetCls,
                            swizzlingSel,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
    }else{
        // 原有类有实现方法
        method_exchangeImplementations(originMethod, swizzlingMethod);
    }
}




@end
