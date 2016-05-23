//
//  MyTestClass.m
//  Test160527
//
//  Created by David June Kang on 2016. 5. 17..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "MyTestClass.h"

@implementation MyTestClass

+ (instancetype) alloc{
    NSLog(@"My Test Class alloc\n");
    
    [self testClassMethod];
//    [self testInstanceMethod]; // 호출불가
    NSLog(@"My class: %@", NSStringFromClass([super class]));
    return [super alloc];
}

- (void)dealloc
{
    NSLog(@"My Test Class dealloc\n");
    
    //사용하고 있던 메모리 공간을 해제해줘야 할때
    //객체가 메모리에서 해제되는 시점을 파악하고자 할떄
    [self testInstanceMethod];
//    [self testClassMethod]; //호출불가
    NSLog(@"My class: %@", NSStringFromClass([super class]));

    [[self class]testClassMethod];
    [MyTestClass testClassMethod];
    
//    [super dealloc]; // 직접호출하지 말라가 규칙이다 (만약 자동메모리관리를 끄면 넣어줘야한다)
    
}

- (void) testInstanceMethod{
    NSLog(@"testInstanceMethod called");
    
}

+ (void) testClassMethod{
    NSLog(@"testClassMethod called");
}

@end
