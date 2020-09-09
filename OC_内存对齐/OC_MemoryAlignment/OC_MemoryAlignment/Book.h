//
//  Book.h
//  OC_MemoryAlignment
//
//  Created by TL on 2020/9/9.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (nonatomic,copy) NSString * bookName;

@property (nonatomic,copy) NSString * bookAuth;

@property (nonatomic,assign) float  bookVersion;

@property (nonatomic,assign) int  pageNnumbers;

@end

NS_ASSUME_NONNULL_END
