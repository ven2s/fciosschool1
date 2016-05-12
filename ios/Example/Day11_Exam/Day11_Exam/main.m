//
//  main.m
//  Day11_Exam
//
//  Created by David June Kang on 2016. 5. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

//총점
NSInteger totalSubjects(NSArray *subjects){
    NSInteger totalScore;
    for(NSNumber *score in subjects){
        //(NSInteger) score가 안되는 이유는 주소값이기 때문에 값이 명확하게 들어 있지 않다.
        totalScore += score.integerValue;
    }
    return totalScore;
}

//평균
CGFloat averageSubjects(NSArray *subjects){
    //return totalSubjects(subjects) / subjects.count;
    CGFloat total = (CGFloat) totalSubjects(subjects);
    return total / subjects.count;
}


void printList(NSArray *subjects){
    NSLog(@"total : %ld\n", totalSubjects(subjects));
    NSLog(@"avg   : %f\n",averageSubjects(subjects));
}

void upgradeGooGooDan(NSArray *dans){
    if(dans.count > 0){
        for(NSNumber *value in dans){
            for(int i=1; i<=9; i++){
                NSLog(@" %ld * %d = %ld\n", value.integerValue, i, value.integerValue * i);
            }
            NSLog(@"==============\n");
        }
    }else{
        NSLog(@"Error : array size is %ld", dans.count);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSArray *subjectList = @[@100,@99,@34,@78,@55,@10];
        printList(subjectList);
        
        NSArray *dans = @[@3,@7,@9];
        
        upgradeGooGooDan(dans);
        
        //upgradeGooGooDan(@[]);
        
    }
    return 0;
}
