//
//  TrayBox.h
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkObject.h"

static const NSInteger maximumDrinkCount = 4;

@interface TrayBox : NSObject

@property (nonatomic, readonly, strong) NSArray *drinkKinds;
- (instancetype)init;

@end
