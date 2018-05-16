//
//  main.m
//  New-project_26-ConcurrentOperations
//
//  Created by Geraint on 2018/5/17.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ConcurrentProxessor.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        NSInteger result = 0;
        
        // 创建操作对象
        ConcurrentProxessor *proc1 = [[ConcurrentProxessor alloc] initwithData:&result computations:5];
        ConcurrentProxessor *proc2 = [[ConcurrentProxessor alloc] initwithData:&result computations:10];
        ConcurrentProxessor *proc3 = [[ConcurrentProxessor alloc] initwithData:&result computations:20];
        
        NSArray *operations = @[proc1,proc2,proc3];
        
        // 添加操作间的依赖性
        [proc2 addDependency:proc1];
        [proc3 addDependency:proc2];
        
        // 将操作对象添加到操作队列中执行
        [queue addOperations:operations waitUntilFinished:NO];
        
        // 等待，当完成所有操作时显示结果
        [queue waitUntilAllOperationsAreFinished];
        NSLog(@"Computation result = %ld", result);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
