//
//  main.m
//  day9Test
//
//  Created by David June Kang on 2016. 5. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
char selector;

void floatCalc(float num1, float num2, char operator);
void calcRoom(float num1);
void calcRound(float radious);
void exchangeToDollar(int rate, int money);
int main(int argc, const char * argv[]) {
    NSString *str = @"1. 산술함수 연산\n2. 평수구하기\n3. 원의둘레구하기\n4. 달러환전기\n5.exit";
    
    NSLog(str);

    scanf("%c", &selector);
    float num1, num2;
    if(selector == "1"){
        
        char oper;
        NSLog(@"\n산술연산\n[숫자][연산자][숫자] > ");
        scanf("%f%c%f", &num1, &oper, &num2);
        
        floatCalc(num1, num2, oper);
    }else if(selector == "2"){
        
        NSLog(@"\n평수구하기\n[숫자]m^2 > ");
        scanf("%f",&num1);
        
        calcRoom(num1);
        
    }else if(selector == "3"){
        
        NSLog(@"\n원의 둘레 구하기\n[반지름] > ");
        scanf("%f",&num1);
        calcRound(num1);
    }else if(selector == "4"){
        
        //NSLog(@"");
        
        
    }else{
        
    }
    
    
    return 0;
}

void floatCalc(float num1, float num2, char operator){
    float result = 0.0;
    if(operator == "+"){
        result = num1 + num2;
    }else if (operator == "-"){
        result = num1 - num2;
    }else if (operator == "*"){
        result = num1 * num2;
    }else if (operator == "/"){
        result = num1 / num2;
    }else{
        result = 0;
    }
    
    NSLog(@"결과 > %0.3f %c %0.3f = %0.3f", num1, operator, num2, result);
};
void calcRoom(float num1){
    NSLog(@"결과 > 평수 : %f", num1 * 0.3025);
};
void calcRound(float radious){
    NSlog(@"결과 > 원의 둘레 : %f", radious * 2 * 3.14);
};
void exchangeToDollar(int rate, int money){
    NSlog(@"결과 > $ %0.2f", money * rate);
};