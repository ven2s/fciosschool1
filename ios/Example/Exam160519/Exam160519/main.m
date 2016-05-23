//
//  main.m
//  Exam160519
//
//  Created by David June Kang on 2016. 5. 19..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

const NSUInteger maxValue = 30;
const NSUInteger minValue = 10;

typedef NS_ENUM(NSInteger, StudentCount){
    StudentCountCountMax = 25,
    StudentCountCountMin = 10
};

typedef NS_ENUM(NSInteger, Fruits){
    FruitsApple = 100,
    FruitsPear,
    FruitsPeach,
    FruitsBanana,
    FruitsOrange
    
};

void chooseFruits(Fruits selectedFruit){
    switch(selectedFruit){
        case FruitsApple  :
            printf("사과를 선택했습니다.\n");
            break;
        case FruitsPear   :
            printf("배를 선택했습니다.\n");
            break;
        case FruitsPeach  :
            printf("복숭아를 선택했습니다.\n");
            break;
        case FruitsBanana :
            printf("바나나를 선택했습니다.\n");
            break;
        case FruitsOrange :
            printf("오렌지를 선택했습니다.\n");
            break;
    }
};

typedef NS_OPTIONS(NSInteger, FruitsOption) {
    FruitsOptionApple  = 1 << 0,    //0000 0001
    FruitsOptionPear   = 1 << 1,    //0000 0010
    FruitsOptionPeach  = 1 << 2,    //0000 0100
    FruitsOptionBanana = 1 << 3,    //0000 1000
    FruitsOptionOrange = 1 << 4     //0001 0000
};

typedef NS_ENUM(NSInteger, ff){
    one   = 1 << 0,
    two   = 1 << 1,
    three = 1 << 2
};

//else if 를 안쓰는 이유는 여러개의값을 출력을 해야 하기 때문이다.
//compiler에서 처리 하는 방식에 따라서 == true 가 다를수 있다.
void selectFruitsOptions(FruitsOption options){
    if((options & FruitsOptionApple)){
        printf("사과 ");
    }
    if((options & FruitsOptionPear)){
        printf("배 ");
    }
    if((options & FruitsOptionBanana)) {
        printf("바나나 ");
    }
    if((options & FruitsOptionOrange)){
        printf("오렌지 ");
    }
    if((options & FruitsOptionPeach)){
        printf("복숭아 ");
    }
    printf("가 선택되었습니다.\n");
};

void ffee(ff sel){
    if(sel&one){
        printf("one ");
    }
    if(sel&two){
        printf("two ");
    }
    if(sel&three){
        printf("three ");
    }
    printf("\n");
}

bool canOpenClass(int numberOfStudent);

int main(int argc, const char * argv[]) {
    
    canOpenClass(100);
    canOpenClass(30);
    canOpenClass(5);
    
    chooseFruits(104);
    chooseFruits(FruitsOrange);
    
    printf("%ld\n",FruitsOrange);
    
    
    selectFruitsOptions( FruitsOptionPear | FruitsOptionBanana);
    selectFruitsOptions(25);
    
    
    //ffee(one|two);
    
    return 0;
}

////상수를 사용한것
//bool canOpenClass(int numberOfStudent){
//    if(numberOfStudent > maxValue){
//        printf("학생이 너무 많아요. 열 수 없어요.\n");
//        return false;
//    }else if(numberOfStudent < minValue){
//        printf("학생이 너무 적어요. 열 수 없어요.\n");
//        return false;
//    }else{
//        printf("좋아요 개강합니다.\n");
//        return true;
//    }
//}

//열거형을 사용한것
bool canOpenClass(int numberOfStudent){
    if(numberOfStudent > StudentCountCountMax){
        printf("학생이 너무 많아요. 열 수 없어요.\n");
        return false;
    }else if(numberOfStudent < StudentCountCountMin){
        printf("학생이 너무 적어요. 열 수 없어요.\n");
        return false;
    }else{
        printf("좋아요 개강합니다.\n");
        return true;
    }
}