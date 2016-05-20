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
 
 
 ## 2016.05.16 변경사항
  - 인스턴스 변수 앞 _ 제거
  - 좀더 명확한 변수명으로 변경
 
 ## 2016.05.20 변경사항
  - 변수를 프로퍼티로 변경
 */

#import "Card.h"

////////////////////////////////////////////////////////////
@interface Card()

@property (nonatomic) NSString *cardType;   //카드타입
@property (nonatomic) NSString *cardNumber; //카드넘버
@property (nonatomic) NSString *cardColor;  //카드컬러

@end
////////////////////////////////////////////////////////////

@implementation Card

//카드객체 초기화(잘된 표현)
- (instancetype)initWithCardType:(NSString*)type cardNumber:(NSString*)number cardColor:(NSString*) color
{
    self = [super init];
    if (self) {
        _cardType    = type;
        _cardNumber  = number;
        _cardColor   = color;
    }
    return self;
}

//카드객체초기화(잘못된 표현)
- (void) type:(NSString*)type number:(NSString*)num color:(NSString*) color{
    _cardType    = type;
    _cardNumber  = num;
    _cardColor   = color;
}

//카드객체정보를 출력한다.
- (void) printCard{
    NSLog(@"%@, %@, %@\n", _cardType, _cardNumber, _cardColor);
}

@end
