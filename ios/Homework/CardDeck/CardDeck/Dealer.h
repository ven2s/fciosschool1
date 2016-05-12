//
//  Dealer.h
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//
/*
    Dealer는 카드를 소유한다.(카드를 상속 받아서 사용 가능하도록 함)
 */
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Dealer : Card
//덱을 생성한다.(총 52장 / 조커 2장은 제외)
- (void) createDeck;

//현재 덱을 셔플한다.
- (void) shuffleDeck;

//현재 덱을 보여준다.
- (void) printDeck;

@end
