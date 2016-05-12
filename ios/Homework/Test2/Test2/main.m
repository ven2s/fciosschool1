//
//  main.m
//  day9Test
//
//  Created by David June Kang on 2016. 5. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
//변수선언
int m, r;
float num1, num2;

//선언부
void floatCalc(float num1, float num2, char operator);
void calcRoom(float num1);
void calcRound(float radious);
void exchangeToDollar(int rate, int money);
float roundPrimeNum(float num);
int matchingGrade(float avgPoint);
void scholarshopWithGrade(int grade);

int main(int argc, const char * argv[]) {
    char selector;
    
    while(1){
        //system("clear");//콘솔클리어(근데 안되네요)
        num1 = 0;
        num2 = 0;
        
        printf("\n>>> %d",selector);
        
        printf("\nA. 산술함수 연산\nB. 평수구하기\nC. 원의둘레구하기\nD. 달러환전기\nE. 반올림(소수3째자리)\nG. 성적등급\nH. 장학금\nF. exit\n>");
        
        scanf("%c", &selector);
        
        //printf("%d",selector);
        //비교연산자가 문자를 인식을 못하길래 아스키코드로 바꿨습니다.
        if(selector == 65){
            
            char oper;
            printf("\n산술연산\n[숫자][연산자][숫자] > ");
            scanf("%f%c%f", &num1, &oper, &num2);
            
            floatCalc(num1, num2, oper);
            
        }else if(selector == 66){
            
            printf("\n평수구하기\n[숫자]m^2 > ");
            scanf("%f",&num1);
            
            calcRoom(num1);
            
        }else if(selector == 67){
            
            printf("\n원의 둘레 구하기\n[반지름] > ");
            scanf("%f",&num1);
            calcRound(num1);
            
        }else if(selector == 68){
            
            printf("\n달러환전기\n[금액(원)] > ");
            scanf("%d",&m);
            printf("1$ 당 원 > ");
            scanf("%d",&r);
            
            exchangeToDollar(r, m);
            
        }else if(selector == 'F'){
            printf("END");
            break;
        }else if(selector == 69){
            printf("\n소수점 3자리에서 반올림\n[실수입력] > ");
            scanf("%f",&num1);
            printf("결과 > %f", roundPrimeNum(num1));
        
        }else if(selector == 'G'){
            printf("\n성적등급\n[성적평균] > ");
            scanf("%f",&num1);
            printf("결과 > %d등급", matchingGrade(num1));
        
        }else if(selector == 'H'){
            printf("\n장학금지급율\n성적등급(정수) > ");
            scanf("%d",&m);
            scholarshopWithGrade(m);
        }else{
            printf("ERROR\n\n");
        }
        selector = 0;
    }
    
    return 0;
}

//사칙연산
void floatCalc(float num1, float num2, char operator){
    float result = 0.0;
    if(operator == 43){ // 43 == +
        result = num1 + num2;
    }else if (operator == 45){ // 45 == -
        result = num1 - num2;
    }else if (operator == 22){ // 22 == *
        result = num1 * num2;
    }else if (operator == 47){ // 47 == /
        result = num1 / num2;
    }else{
        result = 0;
    }

    printf("결과 > %0.3f %c %0.3f = %0.3f", num1, operator, num2, result);
};

//평수구하기
void calcRoom(float num1){
    printf("결과 > 평수 : %0.3f\n", num1 * 0.3025);
};

//원의둘레구하기
void calcRound(float radious){
    printf("결과 > 원의 둘레 : %0.3f\n", radious * 2 * 3.141592);
};

//달러환전기
void exchangeToDollar(int rate, int money){
    printf("결과 > $ %0.2f\n", (float)money / (float)rate);
};

//반올림
float roundPrimeNum(float num){
    
    int temp = (num * 100 + 0.5);
    return (float)temp/100;
    
};

//성적 등급 매기기
int matchingGrade(float avgPoint){
    int result;
    if(avgPoint >=90){
        result = 1;
    }else if(avgPoint >= 80 && avgPoint < 90){
        result = 2;
    }else if(avgPoint >= 70){
        result = 3;
    }else{
        result = 0;
    }
    return result;
}

//장학금지급 %
void scholarshopWithGrade(int grade){
    switch (grade) {
        case 1:
            printf("전액장학금");
            break;
        case 2:
            printf("50%%");
            break;
        case 3:
            printf("25%%");
            break;
        default:
            printf("없음");
            break;
    }
}