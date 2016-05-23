//
//  main.m
//  Exam160519_2
//
//  Created by David June Kang on 2016. 5. 19..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
////////////////////////////////////////////

@interface TestClass : NSObject

@end

@implementation TestClass

- (void) dealloc{
    NSLog(@"TestClass dealloc");
   // [super dealloc];
}

@end

////////////////////////////////////////////


TestClass *globalReference = nil;
__weak TestClass *globalReference2 = nil;

void test(){
//    TestClass *testInstance = [[TestClass alloc]init];
//    NSLog(@"%ld",[testInstance retainCount]);
//    
//    [testInstance retain];  //객체를 필요를 인해서 참조를 한다.
//    
//    NSLog(@"%ld",[testInstance retainCount]);
//    
//    //[testInstance dealloc]; //강제로 해제시킨다. (가급적 사용하지 말것)
//    
//    [testInstance release];
//    NSLog(@"%ld",[testInstance retainCount]); //retainCount는 명확하다고 볼수가 없다. (참고용으로만 사용)
//    
//    [testInstance release];
//    NSLog(@"%ld",[testInstance retainCount]);
    
    
//    __weak TestClass *testInstance = [[TestClass alloc]init];
//    
//    NSLog(@"test instance alloced");
//    
//    testInstance = nil;
//    
//    TestClass *testInstance2 = [[TestClass alloc]init];
//    
//    NSLog(@"test instance alloced");
//    
//    testInstance2= nil;
//    
//    
//    NSLog(@"test End");

//    //강한 참조
//     TestClass *testInstance = [[TestClass alloc]init];
//     globalReference = testInstance;
    
    
    //약학참조
    TestClass *testInstance = [[TestClass alloc]init];
    globalReference2 = testInstance;
    NSLog(@"test End");
    
}

int main(int argc, const char * argv[]) {

//    test();
    
    //globalReference = nil; //강한 참조
    
    
    //Property
    MyClass *myInstance = [[MyClass alloc]init];
    
    [myInstance setName:@"David"];
    
    NSLog(@"%@", [myInstance name]);
    
    
    
    
    
    
    return 0;
}
