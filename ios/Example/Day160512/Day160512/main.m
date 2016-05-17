//
//  main.m
//  Day160512
//
//  Created by David June Kang on 2016. 5. 12..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomClass.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CustomClass *cs = [[CustomClass alloc]init];
        
        NSLog(@"roundsNum = %f\n",[cs roundsNum:3.1235]);
        [cs inputYear:2016 afterDay:102];
        NSLog(@"reverseNum(%d) => %ld", 12345, [cs reverseNum:12345]);
        
    }
    return 0;
}
