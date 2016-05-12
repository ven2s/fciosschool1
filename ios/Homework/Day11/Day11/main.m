//
//  main.m
//  Day11
//
//  Created by David June Kang on 2016. 5. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>


int eventDate;

bool isLeapYear(int year);
int lastDayOfMonth(int month, int year);
int totalDayWithDate(int date);

void setEventDate(int date){
    eventDate = date;
}

void calculationDday(int today){
    //1. 이벤트 날짜가 지났는지 체크
    //2. 년도차이구하기
    //3. Day구하기
    //로직
    //int diffDay = (yearDif - beforeDay + afterDay)
    
    //4. D+, D- 선택
    
    int beforeDate=0, afterDate=0;
    int beforeYear=0, afterYear=0;
    int rtnDay = 0;
    char selection = '-';
    
    if(eventDate > today){
        beforeDate = today;
        afterDate  = eventDate;
        selection  = '+';
    }else{
        beforeDate = eventDate;
        afterDate  = today;
    }
    
    
    beforeYear = beforeDate / 10000;
    afterYear  = afterDate  / 10000;
    
    rtnDay = (afterYear-beforeYear) * 365;
    
    for(int i=beforeYear; i<afterYear; i++){
        if(isLeapYear(i)) rtnDay += 1;
    }
    
    rtnDay += (totalDayWithDate(afterDate) - totalDayWithDate(beforeDate));
    
    printf("D %c %d \n",selection, rtnDay + (selection == '-' ? 0 : 1));
}

int main(int argc, const char * argv[]) {
    
    setEventDate(20150101);
    calculationDday(20160509);
    
    return 0;
}


bool isLeapYear(int year){
    if((year%4==0 && year%100!=0) || year%400==0) return true;
    return false;
}

int lastDayOfMonth(int month, int year){
    int day = 0;
    if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
        day = 31;
    }else if(month == 4 || month == 6 || month == 9 || month == 11){
        day = 30;
    }else if(month == 2){
        day = 28;
        if(isLeapYear(year)) day = 29;
    }
    return day;
}


int totalDayWithDate(int date){
    
    int returnDay = 0;
    
    int year = 0, month = 0, day =0;
    
    year  = date / 10000;
    month = (date/100) % 100;
    day   = date%100;
    
    for(int i=1; i<month; i++){
        returnDay += lastDayOfMonth(i, year);
    }
    
    returnDay += day;
    
    return returnDay;
}