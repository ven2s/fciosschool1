//
//  main.m
//  TestScore
//
//  Created by David June Kang on 2016. 5. 10..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculationScore.h"
#import "ToolBox.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        /********************************
         * 1.선언된 Class 를 개체로 선언
         * 2.메소드 실행
         * 3.출력
         *********************************/
        
        //객체선언
        CalculationScore *csClass = [[CalculationScore alloc]init];
        
        //메소드 호출 [객체명 메소드명:매개변수]
        [csClass addSubjectScore:100];
        [csClass addSubjectScore:90];
        [csClass addSubjectScore:15];
        
        //출력
        NSLog(@"average = %0.2f", [csClass averageScore]);
        
        //모든스코어의 등급을 표기
        [csClass showAllScore];
        
        //모든 스코어의 등급별로 포인트를 표기
        [csClass showAllPoint];
        
        NSLog(@"====================\n\n");
        
        //사칙연산 더하기
        NSLog(@"> %0.4f + %0.4f = %0.4f\n", 3.1123, 5.1123,[ToolBox addNum1:3.1123 addNum2:5.1123]);
        
        //사칙연산 곱하기
        NSLog(@"> %0.4f * %0.4f = %0.4f\n", 1231.11, 12341.12,[ToolBox multiNum1:1231.11 multiNum2:12341.12]);
        
        //사칙연산 빼기
        NSLog(@"> %0.4f - %0.4f = %0.4f\n", 6.1121, 1.2223,[ToolBox subNum1:6.1121 subNum2:1.2223]);
        
        //사칙연산 나누기
        NSLog(@"> %0.4f - %0.4f = %0.4f\n", 1024.11, 5.223,[ToolBox divNum1:1024.11 divNum2:5.223]);
        
        //inch -> Cm 변환
        NSLog(@"> %0.1f(inch) => %0.5f(cm)\n", 3.0, [ToolBox inchToCm:3.0]);
        
        // CM -> inch 변환
        NSLog(@"> %0.4f(cm) => %0.4f(inch)\n", 5.4, [ToolBox cmToInch:5.4]);

        
        //제곱미터 -> 평 변환
        NSLog(@"> %0.4f(제곱미터) => %0.4f(평)\n", 4.0, [ToolBox m2ToPyung:4.0]);
        
        //평 -> 제곱미터 변환
        NSLog(@"> %0.4f(평) => %0.4f(제곱미터)\n", 32.1, [ToolBox pyungTom2:32.1]);
        
        //섭씨 -> 화씨 변환
        NSLog(@"> %0.4f(C) => %0.4f(F)\n", 26.0, [ToolBox cToF:26.0]);
        
        //화씨 -> 섭씨
        NSLog(@"> %0.4f(F) => %0.4f(C)\n", 100.0, [ToolBox fToC:100.0]);
        
        //킬로바이트 -> 메가바이트
        NSLog(@"> %0.4f(KB) => %0.4f(MB)\n", 1024.0, [ToolBox kbToMB:1024.0]);
        
        //메가바이트 -> 기가바이트
        NSLog(@"> %0.4f(MB) => %0.4f(GB)\n", 1024000.0, [ToolBox mbToGB:1024000.0]);
        
        NSLog(@"> %f => %f\n\n", 3.134, [csClass roundLast:3.134]);
        
    }
    return 0;
}
