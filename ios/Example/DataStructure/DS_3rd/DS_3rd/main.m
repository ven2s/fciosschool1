//
//  main.m
//  DS_3rd
//
//  Created by David June Kang on 2016. 5. 25..
//  Copyright © 2016년 ven2s. All rights reserved.
//


//에라토스테네스의 체

// 1. 2~n까지 구할경우 2부터 시작한다.
// 2. 소수의 배수를 제외한 수를 배열에 담는다
/*
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSMutableArray *prime = [[NSMutableArray alloc]initWithCapacity:1];
    
    NSInteger rangeNumber = 100000;
    
    //check YES면 소수(지워지지않음) NO면 소수가 아니다(지워짐)
    NSMutableArray *check = [NSMutableArray arrayWithCapacity:rangeNumber+1];
    
    //BOOL[] 값을 모두 NO 초기화
    for(NSInteger i=0;i<=rangeNumber;i++){
        [check addObject:[NSNumber numberWithBool:YES]];
    }
    
    for(NSInteger i=2; i<=rangeNumber; i++){
       
        if([check[i] boolValue] == YES){
            
            [prime addObject:@(i)];
    
            for(NSInteger j=i*i; j<=rangeNumber; j+=i){
                check[j] = @(NO);
            }
        }
    }
    
    //소수출력
    for(NSNumber *primeValue in prime){
        NSLog(@"%ld", primeValue.integerValue);
    }
    
    NSLog(@"%ld", prime.count);
    
}
*/
//피보나치의 수
//피보나치의 수는 0과 1로 시작을 한다.
// Fn = F(n-1)+F(n-2) n>=2
//n번째 피보나치의 수는?

//젠장 못하겠다
/*
#import <Foundation/Foundation.h>

int main(){
    NSInteger inputNumber;
    
    NSMutableArray *fiboncciArry = [[NSMutableArray alloc]initWithCapacity:1];
    
    scanf("%ld", &inputNumber);
    
    NSNumber *resultNum;
    
    //0 1 1 2 3 5 8
    fiboncciArry[0] = @(0);
    fiboncciArry[1] = @(1);
    
    for(NSInteger i=2; i<inputNumber; i++){
//        fiboncciArry[i] = fiboncciArry[i-1] + fiboncciArry[i-2];
       
    }
    
    
    return 0;
}

*/

//2 * n 의 방법의 갯수 구하기
// |  |  - -
// |  |  _ _  2는 2
// 1< n < 10000
//  출력은 10007을 나눈 숫자를 출력

/*
#import <Foundation/Foundation.h>
int main(){
    NSInteger inputNumber;
    
    scanf("%ld", &inputNumber);
    
    for(int i=1; i<=inputNumber; i++){
        
    
    }
    
    return 0;
}
*/
