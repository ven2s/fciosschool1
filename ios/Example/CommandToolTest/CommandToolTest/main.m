//
//  main.m
//  CommandToolTest
//
//  Created by David June Kang on 2016. 5. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

int age;
float hight;
bool loginChk;
double pai;
const int YEAR = 2016;
int lang=0, math=0, english=0, science=0;

void setLang(int point){
    lang = point;
}
void setEng(int point){
    english = point;
}
void setMath(int point){
    math = point;
}
void setScience(int point){
    science = point;
}


int getTotalPoint(){
    return lang + english + math + science;
}


float getAvgPoint(){
    return ((float) getTotalPoint() )/ 4;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        age = 28;
        hight = 168.9;
        loginChk = true;
        pai = 3.140000000;
        //YEAR = 0000;
        
        NSLog(@"age=%d, hight=%1.2f, ",age, hight);
        
        /*
        int cokePrice;
        int coffePrice;
        int juicePrice;
        
        int language;
        int math;
        int english;
        
        int beverageCount;
        int totalPoint;
        
        int maxBeverageCnt;
        
        int avgPoint;
        
        int change; //거스름돈
        
        char userName;
        
        char selectedBeverageName;
        
        
        char currPlayMusicId;
        char settingBtn;
        char playedMusicList;
        char resutlConsole;
        char likedCnt;
        char mainScrn;
        char rplInputArea;
        char userId;
        char menuBtn;
        char userInfo;
        */
        
        setLang(60);
        setEng(80);
        setMath(70);
        setScience(70);
        
        printf("총점 = %d , 평균 = %0.2f\n",getTotalPoint(), getAvgPoint());
        
        
    }
    return 0;
}

//C의문법
int beveragePrice(char name){
    return 0;
}

