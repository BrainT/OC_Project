//
//  main.m
//  cache_t脱离源码分析
//
//  Created by TL on 2020/9/20.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import <objc/runtime.h>
typedef uint32_t mask_t;

struct my_buckt_t {
    SEL _sel;
    IMP _imp;
};
struct my_cache_t {
    struct my_buckt_t * _buckets;
    mask_t _mask;
    uint16_t _flags;
    uint16_t _occupied;
};
struct my_class_data_bits_t{
    uintptr_t bits;
};
struct my_objc_class {
    Class ISA;
    Class superclass;
    struct my_cache_t cache;             // formerly cache pointer and vtable
    struct my_class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Book * book = [Book alloc];
        Class bClass = [Book class];
//        book.bookName = @"Object-C";
//        book.version = @"1.0.0";
        
        [book read1];
//        [book read2];
//        [book read3];
        struct my_objc_class * my_bClass = (__bridge struct my_objc_class *)(bClass);
        
        NSLog(@"occupied：%hu - mask：%u",my_bClass->cache._occupied, my_bClass->cache._mask);
        
        for (mask_t i = 0; i < my_bClass->cache._mask; i ++) {
            // 打印获取的bucket
            struct my_buckt_t  bucket = my_bClass->cache._buckets[i];
            NSLog(@"sel：%@ - imp：%p",NSStringFromSelector(bucket._sel),bucket._imp);
        }
    }
    return 0;
}
