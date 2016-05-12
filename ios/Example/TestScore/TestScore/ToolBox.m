//
//  ToolBox.m
//  TestScore
//
//  Created by David June Kang on 2016. 5. 10..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ToolBox.h"
#import <math.h>

@implementation ToolBox{
    
}

//사칙연산 더하기
+ (CGFloat) addNum1:(CGFloat) num1 addNum2:(CGFloat) num2{
    return ((NSInteger) ((num1+num2)*100)+0.5) / 100;
}

//사칙연산 곱하기
+ (CGFloat) multiNum1:(CGFloat)num1 multiNum2:(CGFloat)num2{
    return ((NSInteger) ((num1*num2)*100)+0.5) / 100;
}

//사칙연산 빼기
+ (CGFloat) subNum1:(CGFloat) num1 subNum2:(CGFloat) num2{
    return ((NSInteger) ((num1-num2)*100)+0.5) / 100;}

//사칙연산 나누기
+ (CGFloat) divNum1:(CGFloat) num1 divNum2:(CGFloat) num2{
    return ((NSInteger) ((num1/num2)*100)+0.5) / 100;
}

//inch -> Cm 변환
+ (CGFloat) inchToCm:(CGFloat) inch{
    return inch * 2.54;
}

// CM -> inch 변환
+ (CGFloat) cmToInch:(CGFloat) cm{
    return cm / 2.54;
}

//제곱미터 -> 평 변환
+ (CGFloat) m2ToPyung:(CGFloat) m2{
    return m2 * 3.30579;
}

//평->제곱미터 변환
+ (CGFloat) pyungTom2:(CGFloat) pyung{
    return pyung / 3.30579;
}

//섭씨->화씨 변환
+ (CGFloat) cToF:(CGFloat) cellsius{
    return cellsius * 32;
}

//화씨->섭씨 변환
+ (CGFloat) fToC:(CGFloat) farenheit{
    return farenheit / 32;
}

//킬로바이트->메가바이트 변환
+ (CGFloat) kbToMB:(CGFloat) kiloByte{
    return kiloByte / 1024;
}

//메가바이트->기가바이트 변환
+ (CGFloat) mbToGB:(CGFloat) megaByte{
    return megaByte / 1024;
}

@end
