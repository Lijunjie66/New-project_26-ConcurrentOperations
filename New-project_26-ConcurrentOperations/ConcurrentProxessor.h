//
//  ConcurrentProxessor.h
//  New-project_26-ConcurrentOperations
//
//  Created by Geraint on 2018/5/17.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConcurrentProxessor : NSOperation

@property (readonly) NSUInteger computations; // 执行操作 次数

- (id)initwithData:(NSInteger)result computations:(NSUInteger)computations;

@end
