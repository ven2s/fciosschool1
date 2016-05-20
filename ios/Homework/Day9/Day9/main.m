//
//  main.m
//  Day9
//
//  Created by David June Kang on 2016. 5. 5..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

//절대값구하기
void absoluteNum(int num){
    int temp;
    if(num < 0){
        temp = num * -1;
    }else{
        temp = num;
    }
    printf("%d\n", temp);
}

//문자구분
void checkAlphabet(char str){
    if(str >= 'a' && str <='z'){
        printf("%c는 대문자입니다\n", str);
    }else if(str >='A' && str <= 'Z'){
        printf("%c는 소문자입니다\n", str);
    }else if(str >='0' && str <= '9'){
        printf("%c는(은) 숫자입니다\n", str);
    }else{
        printf("ERROR : %c",str);
    }
}

//윤년계산
void checkLeapYear(int year){
    if((year % 4 == 0 && year % 100 !=0) || year % 400 == 0){
        printf("%d년은 윤년입니다.\n",year);
    }else{
        printf("%d년은 윤년이 아닙니다.\n", year);
    }
}
//구구단
void showMultiplicationTable(int num){
    for(int i=1;i<=9;i++){
        printf("%d * %d = %d\n", num, i, num*i);
    }
}

int power(int num1 , int num2){
    int tmp;
    while(num2--){
        tmp *= num1;
    }
    return tmp;
}
//factorial
void factorial(int num){
    int facto =1;
    for(int i=1; i<=num; i++){
        facto *= i;
    }
    printf("%c%d = %d\n",33,num,facto);
}

void game369(int num){
    int idx = 1, cnt=0;
    while(idx<=num){
        for(int i=idx; i>0;i=i/10){
            if(i%10==3|| i%10==6|| i%10==9){
                cnt++;
            }
        }
        
        if(cnt>0){
            for(int j=0; j<cnt; j++){
                printf("*");
            }
            cnt=0;
        }else{
            printf("%d",idx);
        }
        
        printf(", ");
        idx++;
    }
    printf("\n");

}

int main(int argc, const char * argv[]) {
   
    absoluteNum(-124);
    checkAlphabet('C');
    checkAlphabet('c');
    checkAlphabet('1');
    
    checkLeapYear(2000);
    checkLeapYear(2100);
    checkLeapYear(2016);
    
    showMultiplicationTable(3);
    
    factorial(5);
    game369(333);
    
    return 0;
}
