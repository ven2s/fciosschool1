//
//  DataCenter.h
//  SingletionTest
//
//  Created by David June Kang on 2016. 6. 2..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (void) printData;


@end
