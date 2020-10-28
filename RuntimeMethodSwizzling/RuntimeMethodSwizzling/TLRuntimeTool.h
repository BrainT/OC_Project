//
//  TLRuntimeTool.h
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/28.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface TLRuntimeTool : NSObject

+(void)runtimeMethodSwizzlingWithClass:(Class)targetCls originSEL:(SEL)oriSel swizzlingSEL:(SEL)swizzlingSel;

@end

NS_ASSUME_NONNULL_END
