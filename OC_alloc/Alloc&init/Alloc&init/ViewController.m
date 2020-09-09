//
//  ViewController.m
//  Alloc&init
//
//  Created by TL on 2020/9/6.
//  Copyright © 2020 tl. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    Book * book1 = [Book alloc];
    Book * book2 = [book1 init];
    Book * book3 = [book1 init];
    
    NSLog(@"%@ - %p - %p",book1,book1,&book1);
    NSLog(@"%@ - %p - %p",book2,book2,&book2);
    NSLog(@"%@ - %p - %p",book3,book3,&book3);
}


@end
