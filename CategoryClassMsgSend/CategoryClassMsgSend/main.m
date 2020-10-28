//
//  main.m
//  CategoryClassMsgSend
//
//  Created by TL on 2020/9/22.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "English.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#pragma clang diagnostic push
// 让编译器忽略错误
#pragma clang diagnostic ignored "-Wundeclared-selector"
        Book * book = [[Book alloc] init];
        English * english = [[English alloc] init];
       
        [book read];
        [Book write];
        
        
        [English say];
        [english buy];
        
//        [english burnBook];
        [English performSelector:@selector(sell)];
        
#pragma clang diagnostic pop
    }
    return 0;
}
