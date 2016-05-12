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
 */

#import "Dealer.h"

@implementation Dealer
{
    NSMutableArray *cardDeck;
    NSArray *cardType;
    NSArray *cardNum;
    NSArray *cardColor;
}

//@overloading(재정의) init
- (instancetype)init
{
    self = [super init];
    if (self) {
        cardType = @[@"♥︎", @"♠︎", @"♣︎", @"♦︎"]; //4
        cardNum  = @[@"2",@"3", @"4", @"5", @"6", @"7",@"8", @"9", @"10", @"J", @"K", @"Q", @"A"]; //13
        cardColor= @[@"Red", @"Black"]; //2
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
    
    cardDeck = [[NSMutableArray alloc] initWithCapacity:1];//초기화
    
    NSString *color;
    
    for(NSString *type in cardType){
        for(NSString *num in cardNum){
            if([type isEqual:@"♦︎"] || [type isEqual:@"♥︎"]){
                color = cardColor[0];
            }else{
                color = cardColor[1];
            }
            
            card = [[Card alloc]initWithType:type num:num color:color];
            [cardDeck addObject:card];
        }
    }
    
    NSLog(@"%ld", cardDeck.count);
    
    cardDeck = [self shuffleDeck:cardDeck];
}

//셔플1
- (void) shuffleDeck{
    NSInteger ranNum;
    for(NSInteger i=0; i<cardDeck.count; i++){
        ranNum = (arc4random() % cardDeck.count);
        
        if(ranNum >= cardDeck.count){
            ranNum -= 10;
        }
        
        [cardDeck exchangeObjectAtIndex:i withObjectAtIndex:ranNum];
    }
}

//@overloading(재정의) : 셔플1을 다시 정의함
- (NSMutableArray *) shuffleDeck:(NSMutableArray *) array{
    NSInteger ranNum;
    NSMutableArray *retArray = array;;
    
    for(NSInteger i=0; i<retArray.count; i++){
        ranNum = (arc4random() % retArray.count);
        [retArray exchangeObjectAtIndex:i withObjectAtIndex:ranNum];
    }

    return retArray;
}

//덱의 상태를 출력한다.
- (void) printDeck{
    for(Card *c in cardDeck){
        [c printCard];
    }
}

@end
