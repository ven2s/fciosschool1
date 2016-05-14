//
//  DrinkObject.m
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "DrinkObject.h"

@implementation DrinkObject


- (instancetype)initWithName:(NSString *)name cost:(NSInteger)cost{
    self = [super init];
    if (self) {
        _name = name;
        _cost = cost;
    }
    return self;
}


@end
