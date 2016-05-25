//
//  main.c
//  Algorism
//
//  Created by David June Kang on 2016. 5. 18..
//  Copyright © 2016년 ven2s. All rights reserved.
//
/*
#include <stdio.h>

int main(int argc, const char * argv[]) {
    printf("Hello World!");
    return 0;
}

*/
/*
#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int number1, number2;
    
    scanf("%d %d", &number1, &number2);
    printf("%d\n", number1+number2);
    
    return 0;
}
*/
/*
#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int number1, number2;
    
    scanf("%d", &number1);
    scanf("%d", &number2);
    printf("%d\n", number1+number2);
    
    return 0;
}
*/
/*
#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int number1, number2, t;
    
    
    scanf("%d", &t);
    while(1<t){
        scanf("%d %d", &number1, &number2);
        printf("%d\n", number1+number2);
    }
    
    return 0;
}*/
/*
#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int n;
    scanf("%d", &n);
    for(int i=1; i<=9; i++){
        printf("%d * %d = %d\n",n, i, n*i);
    }
    return 0;
}
*/
/*
#include <stdio.h>

int main(){
    int n;
    scanf("%d", &n);
    for(int i = n; i>=1; i--){
        printf("%d\n",i);
    }
    return 0;
}
*/
//오늘은 2007년 1월 1일 월요일이다. 그렇다면 2007년 x월 y일은 무슨 요일일까? 이를 알아내는 프로그램을 작성하시오.
//2007년에는 1, 3, 5, 7, 8, 10, 12월은 31일까지, 4, 6, 9, 11월은 30일까지, 2월은 28일까지 있다.
//SUN, MON, TUE, WED, THU, FRI, SAT
/*
#include <stdio.h>

int main(){
    int x, y, resultDay=0;
    scanf("%d %d", &x, &y);
    
    for(int i=1; i<x; i++){
        switch(i){
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                resultDay += 31;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                resultDay += 30;
                break;
            case 2:
                resultDay += 28;
                break;
        }
    }
 
    resultDay += y;
 
    switch(resultDay % 7){
        case 1: printf("MON\n"); break;
        case 2: printf("TUE\n"); break;
        case 3: printf("WED\n"); break;
        case 4: printf("THU\n"); break;
        case 5: printf("FRI\n"); break;
        case 6: printf("SAT\n"); break;
        case 0: printf("SUN\n"); break;
    }
    
    
    return 0;
}
*/

/*
#include <stdio.h>
int main(){
    int n, min, max;
    scanf("%d", &n);
    int arry[n];
    
    for(int i=0; i<n; i++) {
        scanf("%d",&arry[i]);
    }
    min = arry[0];
    max = arry[0];
    for(int i=0; i<n;i++){
        if(arry[i] < min){
            min = arry[i];
            
        }
        if(arry[i] > max){
            max = arry[i];
        }
    }
    
    printf("%d %d\n", min, max);
    
    return 0;
}
 */
/*
#include <stdio.h>
int main(){
    return 0;
}
*/
/*
#include <stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    
    for(int i=1; i<=n; i++){
        
        for(int k=n-i;k>=1;k--){
            printf(" ");
        }
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        printf("\n");
    }
    
    return 0;
}
*/
/*
#include <stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    
    for(int i=n; i>0; i--){
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        printf("\n");
    }
    
    return 0;
}
*/
/*
#include <stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    
    for(int i=n; i>0; i--){
        
        for(int k=n-i; k>0; k--){
            printf(" ");
        }
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        printf("\n");
    }
    
    return 0;
}
*/
/*
int main(){
    int n;
    scanf("%d",&n);
    
    for(int i=1; i<=n; i++){
        
        for(int k=n-i;k>=1;k--){
            printf(" ");
        }
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        
        for(int l=0; l<i-1; l++){
            printf("*");
        }
        printf("\n");
    }
    
    return 0;
}
 */
/*
#include <stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    
    for(int i=1; i<=n; i++){
        
        for(int k=n-i;k>=1;k--){
            printf(" ");
        }
        
        for(int j=1; j<=i; j++){
            printf("*");
        }
        
        for(int l=0; l<i-1; l++){
            printf("*");
        }
        printf("\n");
    }
    
    for(int i=n-1; i>0; i--){
        
        for(int k=n-i;k>=1;k--){
            printf(" ");
        }
        
        for(int l=0; l<i-1; l++){
            printf("*");
        }
        for(int j=1; j<=i; j++){
            printf("*");
        }
      
        printf("\n");
    }
    
    return 0;
}
*/
/*
#include <stdio.h>
int main(){
    int n;
    int a, b, c;
    scanf("%d",&n);
    a=0;
    c=0;
    b=(n*2)-2;
    for(int i=0; i<(n*2)-1; i++){
        if(i < (n*2)/2){
           
            for(int j=0; j<=a; j++){
                printf("*");
            }
            for(int k=0; k<b; k++){
                printf(" ");
            }
            for(int l=0; l<=c; l++){
                printf("*");
            }
            a++;
            c++;
            b-=2;
        }else if(i>=(n*2)/2){
            a--;
            b+=2;
            c--;
            for(int i=a+1; i>1; i--){
                printf("*");
            }
            for(int k=b+2; k>0; k--){
                printf(" ");
            }
            for(int j=c+1; j>1; j--){
                printf("*");
            }
        }
        printf("\n");
        
    
    }
    
    return 0;
}
*/
/*
#include <stdio.h>
int main(){
    int n;
    int a, b;
    scanf("%d",&n);
    a=0;
    b=(n*2)-2;
    for(int i=0; i<(n*2)-1; i++){
        if(i < (n*2)/2){
            
            for(int j=0; j<a; j++){
                printf(" ");
            }
            for(int k=0; k<=b; k++){
                printf("*");
            }
            
            a++;
  
            b-=2;
        }else if(i>=((n*2)/2)){
            a--;
            b+=2;
            c--;
            for(int i=a; i>1; i--){
                printf(" ");
            }
            for(int k=b+3; k>0; k--){
                printf("*");
            }
        }
        printf("\n");
    }
    return 0;
}
*/
//#include <stdio.h>
//int main(){
//    int n;
//    scanf("%d", &n);
//
//    int a, b;
//    a=n-1;
//    b=0;
//    for(int i=0; i<(n*2)-1; i++){
//        if(i<(n*2)/2){
//            for(int j=0; j<a; j++){
//                printf(" ");
//            }
//            for(int k=0; k<=b; k++){
//                printf("*");
//            }
//            a--;
//            b++;
//        }else if(i>=(n*2)/2){
//            a++;
//            b--;
//            for(int j=a; j>=0; j--){
//                printf(" ");
//            }
//            for(int k=b-1; k>=0; k--){
//                printf("*");
//            }
//        }
//        
//        printf("\n");
//        
//    }
//    return 0;
//}
//
//#include <stdio.h>
//int main(){
//    int n;
//    scanf("%d", &n);
//    
//    for(int i=0; i<n;i++){
//        for(int j=0; j<(2*(n-1)); j++){
//            printf("*");
//        }
//        printf("\n");
//    }
//    for(int i=n; i>0;i--){
//        for(int j=0; j<(2*(n-1)); j++){
//            printf("*");
//        }
//        printf("\n");
//    }
//    return 0;
//}

//push X: 정수 X를 스택에 넣는 연산이다.
//pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
//size: 스택에 들어있는 정수의 개수를 출력한다.
//empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
//top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.

#include <stdio.h>
#include <string.h>

int main(){
    int data[10000];
    char msg[100];
    int size=0, n;
    
    scanf("%d", &n);
    
    for(int i=0; i<n; i++){
        scanf("%s", msg);
        
        if(!(strcmp(msg, "push"))){
            int num;
            scanf("%d", &num);
            data[size++] = num;
        }else if(!(strcmp(msg, "pop"))){
            if(size>0){
                size--;
                printf("%d\n",data[size] != 0 ? data[size] : -1);
            }else{
                printf("%d\n", -1);
            }
        }else if(!(strcmp(msg, "size"))){
            printf("%d\n", size);
        }else if(!(strcmp(msg, "empty"))){
            printf("%d\n", size>0? 0 : 1);
        }else if(!(strcmp(msg, "top"))){
            if(size>0){
                printf("%d\n",data[size-1] != 0 ? data[size-1] : -1);
            }else{
                printf("%d\n", -1);
            }

        }
    }
    
    return 0;
}