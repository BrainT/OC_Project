//
//  Animal.m
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/28.
//  Copyright © 2020 tl. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void)animalInstanceMethod{
    NSLog(@"animal instance method:%s",__func__);
}

+ (void)animalClassMethod{
    NSLog(@"animal class metohd: %s",__func__);
}

@end
