//
//  Animal.h
//  RuntimeMethodSwizzling
//
//  Created by TL on 2020/10/28.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject


-(void)animalInstanceMethod;

+(void)animalClassMethod;

@end

NS_ASSUME_NONNULL_END
