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
    
    Animal * animal = [[Animal alloc] init];
    [animal animalInstanceMethod];
    
    Cat * cat = [[Cat alloc] init];
    [cat animalInstanceMethod];
    
}


@end
