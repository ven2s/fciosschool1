//
//  Card.m
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//

/*
 카드객체만들기
 인스턴스변수 = 타입, number color
 인스턴스메서드 = init(type, number, color)
 */

#import "Card.h"

@implementation Card
{
    NSString *_cardType;
    NSString *_cardNum;
    NSString *_cardColor;
}

//카드객체 초기화(잘된 표현)
- (instancetype)initWithType:(NSString*)type num:(NSString*)num color:(NSString*) color
{
    self = [super init];
    if (self) {
        _cardType = type;
        _cardNum  = num;
        _cardColor= color;
    }
    return self;
}

//카드객체초기화(잘못된 표현)
- (void) type:(NSString*)type num:(NSString*)num color:(NSString*) color{
    _cardType = type;
    _cardNum  = num;
    _cardColor= color;
   // return self;
}

//카드객체정보를 출력한다.
- (void) printCard{
    NSLog(@"%@, %@, %@\n", _cardType, _cardNum, _cardColor);
}

@end
