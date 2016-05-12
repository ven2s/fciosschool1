//
//  Card.h
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

- (instancetype)initWithType:(NSString*)type num:(NSString*)num color:(NSString*) color;
- (void) type:(NSString*)type num:(NSString*)num color:(NSString*) color;
- (void) printCard;

@end
