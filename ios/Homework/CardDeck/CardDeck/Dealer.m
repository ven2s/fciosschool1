//
//  Dealer.m
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//
/*
 딜러 객체
 -인스턴스변수 cardDeck
 -인스턴스메서드 = createDeck, shuffleDeck, printDeck(type, number, color출력))
 
 
 카드의 갯수는 총 54장
 //타입은 총 8
 //넘버는 2~10 A K Q J
 //조커 2장 (조커는 제외시킨다)
 //색상은 검정 빨강
 
 //변경점
 //init 할때  => 카드 정보 
 //셔플은 별도 받아서 리턴만 하도록 
 
 
 ##2016.05.16. 변경점
  1. 변수에 대한 명확한 이름으로 변경
 
 ## 2016.05.20 변경사항
  - 색깔 설정을 NS_ENUM으로 변경
 */

#import "Dealer.h"

typedef NS_ENUM(NSInteger, CardColor){
    CardColorRed,
    CardColorBlack
};


@implementation Dealer
{
    NSMutableArray *cardDeckArray;
    NSArray *cardTypeArray;
    NSArray *cardNumberArray;
    NSArray *cardColorArray;
}

//@overloading(재정의) init
- (instancetype)init
{
    self = [super init];
    if (self) {
        cardTypeArray = @[@"♥︎", @"♠︎", @"♣︎", @"♦︎"]; //4
        cardNumberArray = @[@"2",@"3", @"4", @"5", @"6", @"7",@"8", @"9", @"10", @"J", @"K", @"Q", @"A"]; //13
        cardColorArray = @[@"Red", @"Black"]; //2
    }
    return self;
}

//덱을 생성한다아~ 안에서 셔플을한다
/*
//생성룰
//1. 총 52장
//2. 다이아와 하트는 빨간색, 스페이드와 클러버는 검정색을 가진다
//3. 생성후 셔플을 수행한다.
 */
- (void) createDeck{
    Card *card;
    
    cardDeckArray = [[NSMutableArray alloc] initWithCapacity:1];//초기화
    
    NSString *color;
    
    for(NSString *type in cardTypeArray){
        for(NSString *number in cardNumberArray){
            if([type isEqualToString:@"♦︎"] || [type isEqualToString:@"♥︎"]){
                color = cardColorArray[CardColorRed];
            }else{
                color = cardColorArray[CardColorBlack];
            }
            
            card = [[Card alloc]initWithCardType:type cardNumber:number cardColor:color];
            [cardDeckArray addObject:card];
        }
    }
    
    NSLog(@"%ld", cardDeckArray.count);
    
    cardDeckArray = [self shuffleDeck:cardDeckArray];
}

//셔플1
- (void) shuffleDeck{
    NSInteger randomNumber;
    for(NSInteger i=0; i<cardDeckArray.count; i++){
        randomNumber = (arc4random() % cardDeckArray.count);
        
        if(randomNumber >= cardDeckArray.count){
            randomNumber -= 10;
        }
        
        [cardDeckArray exchangeObjectAtIndex:i withObjectAtIndex:randomNumber];
    }
}

//@overloading(재정의) : 셔플1을 다시 정의함
- (NSMutableArray *) shuffleDeck:(NSMutableArray *) array{
    NSInteger randomNumber;
    NSMutableArray *returnArray = array;
    
    for(NSInteger i=0; i<returnArray.count; i++){
        randomNumber = (arc4random() % returnArray.count);
        [returnArray exchangeObjectAtIndex:i withObjectAtIndex:randomNumber];
    }

    return returnArray;
}

//덱의 상태를 출력한다.
- (void) printDeck{
    for(Card *c in cardDeckArray){
        [c printCard];
    }
}

@end
