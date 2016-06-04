//
//  DataCenter.m
//  SingletionTest
//
//  Created by David June Kang on 2016. 6. 2..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype) sharedInstance{
    static DataCenter *dataCenter  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc]init];
    });
    return dataCenter;
}


- (void) printData{
    NSLog(@"name is %@, age is %ld", self.name, self.age);
}
@end

