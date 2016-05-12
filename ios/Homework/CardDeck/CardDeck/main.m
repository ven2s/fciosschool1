//
//  main.m
//  CardDeck
//
//  Created by David June Kang on 2016. 5. 11..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dealer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dealer *d = [[Dealer alloc]init];
        
        [d createDeck];
        [d printDeck];
        
        NSLog(@"\n========= Suffle it!!! ========\n");
        [d shuffleDeck];
        [d printDeck];
        
    }
    return 0;
}
