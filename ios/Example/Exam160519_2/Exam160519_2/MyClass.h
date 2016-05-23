//
//  MyClass.h
//  Exam160519_2
//
//  Created by David June Kang on 2016. 5. 19..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject{
    NSInteger _weight;
}

-(NSInteger) weigth;
-(void) setWeigth:(NSInteger) weight;

@property (strong, nonatomic) NSString *name;

@end
