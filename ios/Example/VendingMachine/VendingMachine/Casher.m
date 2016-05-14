//
//  Casher.m
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "Casher.h"

@interface Casher()

@property (nonatomic) NSInteger inputMoney;

@end

@implementation Casher

- (instancetype)init
{
    self = [super init];
    if (self) {
        _inputMoney = 0;
    }
    return self;
}

//동전추가
- (void) addCoin500{
    self.inputMoney += 500;
}

- (void) addCoin100{
    self.inputMoney += 100;
}

-(BOOL)buyDrink:(DrinkObject *)drink{
    if(self.inputMoney >= drink.cost){
        self.inputMoney -= drink.cost;
        return YES;
    }else{
        return NO;
    }
    return NO;
}

//동전반환
- (NSDictionary *) changeMoney{
    
    NSMutableDictionary *changeDic = [[NSMutableDictionary alloc]initWithDictionary:@{@"500":@0, @"100":@0}];
    //500원짜리
    if(self.inputMoney >= 500){
        //500원짜리 갯수
        NSInteger coin500 = self.inputMoney / 500;
        
        //리턴 딕에 추가
        [changeDic setValue:[NSNumber numberWithInteger:coin500] forKey:@"500"];
        
        //남은돈 갱신
        self.inputMoney %= 500;
    }
    
    //100원짜리
    if(self.inputMoney >= 100){
        NSInteger coin100 = self.inputMoney / 100;
        
        [changeDic setValue:[NSNumber numberWithInteger:coin100] forKey:@"100"];
        
        self.inputMoney %= 100;
    }
    
    self.inputMoney = 0;
    
    return changeDic;
}

@end
