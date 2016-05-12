//
//  CustomClass.m
//  20160512
//
//  Created by David June Kang on 2016. 5. 12..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "CustomClass.h"



@implementation CustomClass

- (NSInteger) powNum:(NSInteger)num exp:(NSInteger) exp{
    NSInteger returnNum = 1;
    if(exp == 0){
        returnNum = 1;
    }else{
        for(NSInteger i=0; i<exp; i++){
            returnNum *= num;
        }
    }
    return returnNum;
}

-(NSInteger) leapYear:(NSInteger)year month:(NSInteger)month{
    int day = 0;
    if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
        day = 31;
    }else if(month == 4 || month == 6 || month == 9 || month == 11){
        day = 30;
    }else if(month == 2){
        if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
            day = 29;
        }else{
            day = 28;
        }
    }
    return day;
}

- (CGFloat) roundsNum:(CGFloat)num{
    CGFloat cal1, cal2;
    NSInteger count=0;
    
    cal1 = num;
    cal2 = 0;
    
    while((CGFloat)((NSInteger)cal1)!= cal2){
        
        cal1 *= 10;
        cal2 = cal1;
        
        count++;
    }
    
    return (((NSInteger)(num * (pow(10,count-1)) + 0.5)) / pow(10,count-1));
}

- (void) inputYear:(NSInteger)year afterDay:(NSInteger)day{
    
    NSInteger month =1;
    NSInteger date = 0;
    NSInteger yearDay=0;
    
    if(( year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0 ){
        yearDay = 366;
    }else{
        yearDay = 365;
    }
    
    for(NSInteger i=1; i<=yearDay; i++){
        
        date++;
        if([self leapYear:year month:month] == date) {
            month++;
            date=0;
        }
        //NSLog(@"[%ld] %ld %ld\n", i, month, date);
        
        if(i==day){
            break;
        }
        
    }
    NSInteger lastDayOfMonth = 1;
    
    while(lastDayOfMonth < day){
        
    }
    
    NSLog(@"%ld년 %ld일 번째의 날은 %ld월 %ld일", year, day, month, date);
    
}

- (NSInteger) reverseNum:(NSInteger)num{
    NSMutableArray *arry = [[NSMutableArray alloc]initWithCapacity:1];
    NSInteger value = num;
    NSInteger num1=1;
    NSNumber *val = 0;
    
    while(1){
        if(num <= 0){
            break;
        }
        
        value = num %10;
       
        [arry addObject:[NSNumber numberWithInteger:value]];
        //NSLog(@"%ld %ld\n",value, num);
        
        num /= 10;
    }
    
    value = 0;
    num1 =(arry.count-1);
    
    for(NSInteger i=0; i<arry.count; i++){
        
        val = arry[i];
        
        value += val.integerValue * [self powNum:10 exp:num1];
       // NSLog(@"%ld %ld %ld\n",val.integerValue, value, [self powNum:10 exp:num1]);
        num1--;
         
        //NSLog(@"%@\n",arry[i]);
    }
    
    return value;
}
@end
