//
//  Card.h
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Card : NSObject

- (instancetype)initWithCardType:(NSString*)type cardNumber:(NSString*)num cardColor:(NSString*) color;
- (void) printCard;

@end
