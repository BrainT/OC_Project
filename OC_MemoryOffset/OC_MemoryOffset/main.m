//
//  main.m
//  OC_MemoryOffset
//
//  Created by TL on 2020/9/15.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        int a = 100;
//        short b = 100;
//        NSLog(@"\n%d -- %p  \n%d -- %p",a,&a,b,&b);
        
//        Book * book1 = [Book alloc] ;
//        Book * book2 = [Book alloc] ;
//        NSLog(@"\n%p -- %p  \n%p -- %p",book1,&book1,book2,&book2);

        
        //数组指针
        int c[4] = {1, 2, 3, 4};
        int *d = c;
        NSLog(@"%p -- %p - %p", &c, &c[0], &c[1]);
        NSLog(@"%p -- %p - %p", d, d+1, d+2);
        
    }
    return 0;
}
