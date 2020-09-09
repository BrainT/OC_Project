//
//  ViewController.m
//  OC_MemoryAlignment
//
//  Created by TL on 2020/9/9.
//  Copyright © 2020 tl. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct StructOne{
  double a; // 8字节
  int    b; // 4字节
  short   c; // 2字节
  char   d; // 1字节
}structOne;

struct StructTwo{
  int    b; // 4字节
  double a; // 8字节
  char   c; // 1字节
  short   d; // 2字节
}structTwo;

struct StructThree{
//  int    b; // 4字节
//  double a; // 8字节
     short   c;
  struct StructOne one; // 16
}structThree;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Book * book = [[Book alloc] init];
    book.bookName = @"Objective-C Programming";
//    book.bookVersion = 2.0f;
    book.pageNnumbers = 256;
    
    
    NSLog(@"\nbook:%@ \nsizeof: %lu \nclass_getInstanceSize:%lu \nmalloc_size: %lu",book,sizeof(book),class_getInstanceSize([book class]),malloc_size((__bridge const void *)(book)));
    
    NSLog(@"\n%lu \n%lu \n%lu",sizeof(structOne),sizeof(structTwo),sizeof(structThree));
    
}


@end
