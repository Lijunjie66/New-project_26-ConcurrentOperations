//
//  ConcurrentProxessor.m
//  New-project_26-ConcurrentOperations
//
//  Created by Geraint on 2018/5/17.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "ConcurrentProxessor.h"

@implementation ConcurrentProxessor

{
    NSInteger *computeResult;
}

- (id)initwithData:(NSInteger)result computations:(NSUInteger)computations {
    if (self = [super init]) {
        _computations = computations;
        computeResult = result;
    }
    return self;
}


- (void)main {
    @autoreleasepool {
        @try {
            if (![self isCancelled]) {
                NSLog(@"Performing %ld computations", self.computations);
                [NSThread sleepForTimeInterval:1.0];
                for (int ii = 0; ii<self.computations; ii++) {
                    computeResult = computeResult + 1;
                }
            }
        }
        @catch (NSException *ex) {}
    }
}

@end
