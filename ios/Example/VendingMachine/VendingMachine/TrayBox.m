//
//  TrayBox.m
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "TrayBox.h"

@interface TrayBox()

@property (nonatomic, nullable) NSArray *nameList;
@property (nonatomic, nullable) NSArray *costList;
@property (nonatomic) NSArray *drinkKinds;

@end

@implementation TrayBox

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameList = @[@"Slow Cow", @"에비앙~", @"썬키스트 자몽에이드", @"코카콜라"];
        self.costList = @[@1000, @2000, @1000, @500];
        [self createTray];
    }
    return self;
}

- (void) createTray{
    
    NSMutableArray *drinkList = [[NSMutableArray alloc]init];
    
    for(int i=0; i<maximumDrinkCount; i++){
        NSString *drinkName = _nameList[i];
        NSInteger drinkCost = ((NSNumber *)_costList[i]).integerValue;
        
        DrinkObject *drink = [[DrinkObject alloc]initWithName:drinkName cost:drinkCost];
        [drinkList addObject:drink];
    }
    self.drinkKinds = [[NSArray alloc]initWithArray:drinkList];
}


@end
