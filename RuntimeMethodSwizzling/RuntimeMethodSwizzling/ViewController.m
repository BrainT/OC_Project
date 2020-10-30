//
//  ViewController.m
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/28.
//  Copyright © 2020 tl. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "Cat.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray * mutA = @[@"3",@"2"];
    NSLog(@"%@",[mutA objectAtIndex:3]);
    
    
    
//    Cat * cat = [[Cat alloc] init];
//    [cat animalInstanceMethod];
//
//    Animal * animal = [[Animal alloc] init];
//    [animal animalInstanceMethod];

    
}


@end
