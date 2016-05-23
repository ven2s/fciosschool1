//
//  main.c
//  DS_Secnon
//
//  Created by David June Kang on 2016. 5. 23..
//  Copyright © 2016년 ven2s. All rights reserved.
//

/*
 자료구조 및 알고리즘
  - 배열을 사용해서 괄호 닫힘 여부 구하기 (단 스택방법)
 
*/
/*
#include <stdio.h>
#include <string.h>
char str[1000]; //받을 문자열
int n ; //반복 갯수

int main(int argc, const char * argv[]) {
    
    scanf("%d", &n);
    
    
    for(int i=0; i<n; i++){
        
        scanf("%s", str);
        int cnt = 0;
        int negative = 0;
        
        for(int j=0; j<strlen(str); j++){
            
            if(str[j] == '('){
                cnt+=1;
            }else{
                cnt-=1;
            }
            
            if(cnt<0){
                negative = 1;
            }
        }
        
        if(negative == 0 && cnt == 0){
            printf("YES\n");
        }else{
            printf("NO\n");
        }
        
    }
    
    
    return 0;
}
*/


//텍스트 에디터
//L : 커서를 왼쪽 한칸옴김
//D : 커서를 오른쪽으로 한칸
//B : 왼쪾 문자를 삭제
//P$: $는 문자를 커서 오른쪽에 추가함
//O(N^2) = > 스택으로는  O(N)
/*
#include <stdio.h>
#include <string.h>

char left[5000000];
char right[5000000];

long left_size = 0;
long right_size = 0;

int main(){
    
    scanf("%s",left);

    left_size = strlen(left);
    
    int t ;
    scanf("%d",&t);
    
    for(int i=0; i<t; i++){

        char cmd;
        
        scanf(" %c", &cmd);
        
        if(cmd == 'L'){
            if(left_size >  0){
                right[right_size] = left[left_size-1];
                left[left_size-1] = 0;
                right_size+=1;
                left_size -=1;
            }
            
        }else if(cmd == 'D'){
            if(right_size > 0){
                left[left_size] = right[right_size-1];
                right[right_size-1] = 0;
                left_size +=1;
                right_size-=1;
            }
        }else if(cmd == 'B'){
            if(left_size > 0) {
                left[left_size-1] = 0;
                left_size-=1;
            }
        }else if(cmd == 'P'){
            char x;
            scanf(" %c", &x);
            left[left_size] = x;
            left_size+=1;
        }
    }
    
    for(int j=0; j<left_size; j++){
        printf("%c",left[j]);
    }

    for(long k=right_size-1; k>=0;k--){
        printf("%c",right[k]);
    }
    printf("\n");

    return 0;
}
*/

//QUE : 먼저 들어온놈이 먼저 나감
// * 우선순위 큐 : 우선순위에 따라 먼저 나옴
// * 일반적인 큐 : First In First Out
/*
#include <stdio.h>
#include <string.h>

int queue[5000000];
char cmd[100];
int str_size = 0;
int front = 0;
int back  = 0;

int main(){
    
    int n ;
    
    scanf("%d", &n);
    
    for(int i=0; i<n; i++){
        
        scanf("%s", cmd);
        
        if(!strcmp(cmd, "push")){
            int num;
            scanf("%d", &num);
            queue[back] = num;
            //printf("%d\n", queue[back]);
            back+=1;
        }else if(!strcmp(cmd, "pop")){
            if(front == back){
                printf("-1\n");
            }else{
                printf("%d\n", queue[front]);
                front +=1;
            }
        }else if(!strcmp(cmd, "size")){
            printf("%d\n", back-front);
        }else if(!strcmp(cmd, "empty")){
            if(front == back){
                printf("1\n");
            }else{
                printf("0\n");
            }
        }else if(!strcmp(cmd, "front")){
            if(front == back){
                printf("-1\n");
            }else{
                printf("%d\n", queue[front]);
            }

        }else if(!strcmp(cmd, "back")){
            if(front == back){
                printf("-1\n");
            }else{
                printf("%d\n", queue[back-1]);
            }
        }
    }
    
    return 0;
}
*/
/*
 Deque 덱
 
 
 */

#include <stdio.h>
#include <string.h>

int data[10000000];
int begin = 0;
int end = 0;

int main(){
    
    int n;
    scanf("%d", &n);
    
    for(int i=0; i<n; i++){
        
        char cmd[100];
        
        scanf("%s", cmd);
        
        if(!strcmp(cmd, "push_front")){
            
        }else if(!strcmp(cmd, "push_back")){
            
        }else if(!strcmp(cmd, "size")){
            
        }else if(!strcmp(cmd, "empty")){
            
        }else if(!strcmp(cmd, "pop_front")){
            
        }else if(!strcmp(cmd, "pop_back")){
            
        }
        
    }
    
    return 0;
}