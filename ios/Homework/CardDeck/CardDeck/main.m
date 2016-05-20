//
//  main.m
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//
/*
 카드덱 구하기
 1. 카드 객체 만들기
  - 인스턴스 변수 ( type , number, color )
  - 인스턴스 메소드 init(type, number, color)
 
 2. 딜러 객체 만들기
  - 인스턴스 변수 (cardDeck)
  - 인스턴스 메소드 (createDeck, shuffleDeck, printDeck)
 
 <참고>
  - 랜덤함수 : arc4random() [무작위 숫자 반환]
  - Array index 변경 메소드 : exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2;

 <comment>
 1.딜러는 카드를 소유한다. 
 2.딜러가 카드덱을 생성을 한다.
 3.카드는 객체이고 별도의 행동은 없음 (단, 자기 자신이 누구인지 보여주는 메소드만 만듬)
 4.딜러가 카드덱을 만들때 셔플을 진행
 5.요청에 의해 카드덱을 셔플을 함(단, 딜러가 1명이 가진 덱은 1개씩)
 6.딜러가 가진 덱을 보여줌
 
 OOP를 적용해서 구현을 했습니다.
 딜러는 카드를 상속하고 카드 자체의 정보는 값은 볼수 없지만 메소드를 통해서 카드정보만 출력 하도록 구현 하였습니다.
 
 
 ##2016.05.16변경점
 Dealer 객체의 매개변수변을 d -> dealer으로 변경
 
 */

#import <Foundation/Foundation.h>
#import "Dealer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dealer *dealer = [[Dealer alloc]init]; //딜러객체초기화
        
        [dealer createDeck]; //카드덱 생성
        [dealer printDeck];  //현재 카드를 보여준다
        
        NSLog(@"\n========= Suffle it!!! ========\n");
        [dealer shuffleDeck]; //딜러가 가지고 있는 덱을 셔플한다.
        [dealer printDeck];   //덱을 보여준다.
        
    }
    return 0;
}
