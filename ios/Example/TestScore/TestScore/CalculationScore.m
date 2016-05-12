//
//  CalculationScore.m
//  TestScore
//
//  Created by David June Kang on 2016. 5. 10..
//  Copyright © 2016년 ven2s. All rights reserved.
//
/*
 과목리스트만들기
 과목 추가하는 함수 만드릭
 과목 총점 구하는 함수
 과목 편균 구하는 함수
 메인함수에서 객체 생성후 총점과 평균 출력
 
 */
#import "CalculationScore.h"

@implementation CalculationScore
{
    NSMutableArray *subjects;
}

//과목을 점수를 추가하는하는 함수
- (void) addSubjectScore:(NSInteger)score{
    
    //Array의 기본공간 할당 == 초기화
    if(subjects == nil){
        subjects = [[NSMutableArray alloc] initWithCapacity:1];
    }
    
    //참조형 타입으로 변환
    NSNumber *scoreNum = [NSNumber numberWithInteger:score];
    
    //배열에 추가
    [subjects addObject:scoreNum];
    
}

//과목총점 구하는 함수
-(NSInteger) totalScore{
    
    NSInteger totalScore = 0;
    
    for (NSNumber *score in subjects) {
        totalScore += score.integerValue;
    }

    return totalScore;
}

//과목 평균 구하는 함수
-(CGFloat) averageScore{
    //과목의 점수가 1개이상일떄
    if(subjects.count > 0){
        return ((CGFloat)[self totalScore])/subjects.count;
    }else{//과목점수가 없을때
        return  0;
    }
}

//시험 점수를 등급으로 반환한다.
+ (NSString *) getScoreGrade:(NSInteger)score{
    
    if(score >=95)       return @"A+";
    else if(score >= 90) return @"A";
    else if(score >= 85) return @"B+";
    else if(score >= 80) return @"B";
    else if(score >= 75) return @"C+";
    else if(score >= 70) return @"C";
    else                 return @"D";
    
}

//등급을 포인트로 변환한다.
+ (CGFloat) changeGradeToPoint : (NSString *) grade{
    if([@"A+" isEqualToString:grade]){
        return 4.5;
    }else if([@"A" isEqualToString:grade]) {
        return 4.0;
    }else if([@"B+" isEqualToString:grade]){
        return 3.5;
    }else if([@"B" isEqualToString:grade]){
        return 3.0;
    }else if([@"C+" isEqualToString:grade]){
        return 2.5;
    }else if([@"C" isEqualToString:grade]){
        return 2.0;
    }else{
        return 0;
    }
}

-(void) showAllScore{
    for(NSNumber *score in subjects){
        NSLog(@"%ld 의 등급 : %@",score.integerValue, [CalculationScore getScoreGrade:score.integerValue]);
    }
}

- (void) showAllPoint{
    NSString *grade;
    for(NSNumber *score in subjects){
        grade = [CalculationScore getScoreGrade:score.integerValue];
        NSLog(@"%@ 등급 > [P] %f", grade, [CalculationScore changeGradeToPoint:grade]);
    }
}

//5월11일 추가
//마지막 숫자 자리 반올림
- (CGFloat) roundLast:(CGFloat)num{
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
@end
