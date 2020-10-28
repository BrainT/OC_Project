//
//  Book.h
//  cache_t脱离源码分析
//
//  Created by TL on 2020/9/20.
//  Copyright © 2020 tl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (nonatomic,copy) NSString * bookName;
@property (nonatomic,copy) NSString * version;

- (void)read1;
- (void)read2;
- (void)read3;
- (void)read4;
@end

NS_ASSUME_NONNULL_END
