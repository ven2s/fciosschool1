//
//  main.m
//  Day10
//
//  Created by David June Kang on 2016. 5. 6..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <time.h>

const int LEAP_YEAR = 366;
const int YEAR = 365;


//스왑
void swap(int num1, int num2){
    int tmp;
    printf("Before : %d, %d\n",num1, num2);
    tmp = num1;
    num1 = num2;
    num2 = tmp;
    printf("swap!\nAfter : %d, %d\n\n", num1, num2);
}

//삼각수구하기 = 5의 삼각수 = 1~5더한값
void triangluarNum(int num1, int num2){
    int result=0;
    for(int i=num1; i<=num2; i++){
        result += i;
    }
    printf("결과 > %d \n\n", result);
}

//특정배수의 삼각수 구하기
void triangluarRangesNum(int num1, int num2, int beaSu){
    int result=0;
    for(int i=num1; i<=num2; i++){
        result += i;
        if(i % beaSu == 0) printf("%d ", result);
    }
    printf("\n\n");
}

void addAllNum(int num){
    int result=0;
    for(int i=num; i>0; i=i/10){
        result += (i%10);
    }
    printf("결과 > %d\n\n",result);
    
}

//윤년 월 -> 일 로 변환
int getLeapDay(int year, int month){
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

//윤년
bool isLeapYear(int year){
    if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) return true;
    return false;
}

//년->일 변환
int getYearToDay(int year){
    int rtnDay = 0;
    for(int i=0; i<year; i++){
        rtnDay += (isLeapYear(i) ? LEAP_YEAR : YEAR);
    }
    return rtnDay;
}


int getMonToDay(int year,int month){
    int rtnDay=0;
    for(int i=1; i<month; i++){
        rtnDay += getLeapDay(year,i);
    }
    return rtnDay;
}

//디데이 계산(기준일-설정일) / 0년도 부터 계산해서 차이 비교
void d_Day(int yyyyMMdd1, int yyyyMMdd2){
    int stdYear, stdMonth, stdDay;
    int setYear, setMonth, setDay;
    int stdTmp, setTmp;
    
    //기준일
    stdYear  = yyyyMMdd1 / 10000;
    stdMonth = (yyyyMMdd1 - stdYear * 10000) / 100;
    stdDay   = (yyyyMMdd1 - stdYear * 10000 - stdMonth * 100);
    
    //설정일
    setYear  = yyyyMMdd2 / 10000;
    setMonth = (yyyyMMdd2 - setYear * 10000) / 100;
    setDay   = (yyyyMMdd2 - setYear * 10000 - setMonth * 100);
    
    stdTmp = getYearToDay(stdYear) + getMonToDay(stdYear, stdMonth) + stdDay;
    setTmp = getYearToDay(setYear) + getMonToDay(setYear, setMonth) + setDay;
    
    //printf("%d %d %d = %d\n",getYearToDay(stdYear), getMonToDay(stdYear, stdMonth), stdDay, stdTmp);
    //printf("%d %d %d = %d\n",getYearToDay(setYear), getMonToDay(setYear, setMonth), setDay, setTmp);
    
    if(setTmp - stdTmp > 0){
        printf("D-Day > %d\n\n",(setTmp - stdTmp)+1);
    }else{
        printf("D-Day > %d\n\n",setTmp - stdTmp);
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// D-Day 아이디어 정리
// 1.기준일 과 이벤트 날짜의 연도차이를 구한다
// 2.두 연도의 차이에 따라 작은 연도를 앞으로 보내어 계산을한다.
//   로직 : 1. 작은 연도 < (구한다) < 큰연도
//         2. 작은연도의 일 구하기
//            (작은연도의 월+1 ~ 작연연도의 12월 까지의 일수) + (작은연도의 월의 일수 - 작은연도의 일))
//         3. 큰연도의 일 구하기
//            (큰연도의 월1 ~ 큰연도의 월-1 까지의 일수) + 큰 연도의 일
//         4. 값은 더하여 출력 (단, 이벤트날짜가 기준일 보다 클 경우 기준년월일에서 -1 을 한뒤 계산한다. 당일을 포함하기 위함)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////
void d_Day2(int yyyymmdd){
    int stdYear = 0, stdMonth = 0, stdDay = 0; //기준일을 년월일을 저장
    int setYear = 0, setMonth = 0, setDay = 0; //설정일의 년월일을 저장
    
    int rtnYearToDay = 0, rtnMonToDay = 0, rtnDay = 0;
    
    bool toward = false; //방향을 설정
    
    time_t timer;
    struct tm *t;
    
    timer = time(NULL);    // 현재 시각을 초 단위로 얻기
    t = localtime(&timer); // 초 단위의 시간을 분리하여 구조체에 넣기
    
    
    //현재일년월일
    stdYear  = (t->tm_year + 1900);
    stdMonth = (t->tm_mon + 1);
    stdDay   = (t->tm_mday);
    
    //설정년월일
    setYear  = yyyymmdd / 10000;
    setMonth = (yyyymmdd - setYear * 10000) / 100;
    setDay   = (yyyymmdd - setYear * 10000 - setMonth * 100);
    
    int year1, month1, day1;
    int year2, month2, day2;
    
    
    //printf("기준일 : %d/%d/%d\n", stdYear, stdMonth, stdDay);
    //printf("설정일 : %d/%d/%d\n\n",setYear, setMonth, setDay);
    
    if((stdYear - setYear) > 0 || (stdYear - setYear) < 0){
        
        //작은년도를 앞으로 보낸다.
        if((stdYear - setYear)>0){ //기준일 전일일경우
            year1 = setYear; month1 = setMonth; day1 = setDay;
            year2 = stdYear; month2 = stdMonth; day2 = stdDay;
            
            toward = false;
        }else{ //기준일 후일일 경우
            year1 = stdYear; month1 = stdMonth; day1 = stdDay-1;//단, 기준일보다 후일일 경우 당일보다 하루전으로 계산
            year2 = setYear; month2 = setMonth; day2 = setDay;
            
            toward = true;
        }
        
        //연을 일로 바꾸기단 설정된 연도와 연도사이만 (설정된 연도는 제외)
        for(int i = year1 + 1; i<year2; i++ ){
            rtnYearToDay += (isLeapYear(i) ? LEAP_YEAR : YEAR);
        }
        
        //월을 일로 바꾸기(작은년도의 월+1 ~ 12년도의 일을 구한다.
        for(int i=month1+1; i<=12; i++){
            rtnMonToDay += getLeapDay(year1, i);
        }
        
        //작은년도의 일수를 구한다.
        rtnDay = getLeapDay(year1, month1) - day1;
        
        //큰년도의 일수를 구한다.
        for(int i=1; i<month2; i++){
            rtnMonToDay += getLeapDay(year2, i);
        }
        
        rtnDay += day2;
        
    }else{ //연도가 같을 경우
        
        //월의 크고 작음에 따라 일수를 구한다.
        
        //기준일 < 설정일
        if(stdMonth-setMonth>0){
            
            year1 = stdYear;
            
            month1 = setMonth;
            month2 = stdMonth;
            
            day1   = setDay;
            day2   = stdDay;
            
            for(int i=month1+1;i<month2; i++){
                rtnMonToDay += getLeapDay(year1,i);
            }
            
            rtnDay = getLeapDay(year1, month1) - (day1);
            
            rtnDay += day2;
            
            toward = false;
        //기준일 > 설정일
        }else if(stdMonth-setMonth<0){
            
            year1 = stdYear;
            
            month1 = stdMonth;
            month2 = setMonth;
            
            day1   = stdDay-1; //기준일을 포함하기 위해서 -1을 한 값을 사용한다. ex) 13-9 = 4 가 되므로 13-8=5 로 나오게함
            day2   = setDay;
            
            for(int i=month1+1;i<month2; i++){
                rtnMonToDay += getLeapDay(year1,i);
            }
            
            rtnDay = getLeapDay(year1, month1) - (day1);
            
            rtnDay += day2;
            
            toward = true;
        }else{
            day1   = stdDay-1;
            day2   = setDay;
            
            rtnDay = (day1-day2);
        }
    }
    
    //printf(" %d, %d, %d (%d)\n", rtnYearToDay, rtnMonToDay, rtnDay, toward);
    
    if(toward){
        printf(" > D-Day : %d\n\n ",((rtnYearToDay + rtnMonToDay + rtnDay)));
    }else{
        printf(" > D-Day : %d\n\n",((rtnYearToDay + rtnMonToDay + rtnDay)*-1));
    }
}

int main(int argc, const char * argv[]) {
    swap(4, 5);
    triangluarNum(1,25);
    triangluarRangesNum(1,25,5);
    addAllNum(5792);
    
    d_Day(20160509, 20170101);
    
    d_Day2(20170101);
    
    return 0;
}
