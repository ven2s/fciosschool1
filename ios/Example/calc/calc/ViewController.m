//
//  ViewController.m
//  calc
//
//  Created by David June Kang on 2016. 5. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //데이터초기화
    [self initData];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//*****************************************************
//* 버튼이벤트
//*****************************************************
//숫자 터치 이벤트
- (IBAction)onTouchUpInsideNumberBtn:(id)sender
{
    NSString * numStr = ((UIButton *)sender).titleLabel.text;
    displyText = [displyText stringByAppendingString:numStr];
    
    [self.displyTextField setText:displyText];
}

//연산자 터치 이벤트
-(IBAction)onTouchUpInsideOperatorBtn:(UIButton *)sender
{
    if(displyText.length > 0 ){
        //기존에 display에 있는 숫자를 결과에 추가한다
        [self operatingWithSecondNum:displyText.integerValue];
        
        //result(결과값)을 텍스트로 변경해서 표시
        [self.displyTextField setText:[NSString stringWithFormat:@"%zd", resultNum]];
        
        //displyText 초기화
        displyText = @"";
        
        //오퍼레이션을 버퍼에 넣는다.
        operatorBuffer = sender.titleLabel.text;
    }else{
        //연산기호 변경
        if(operatorBuffer.length != 0){
            operatorBuffer = sender.titleLabel.text;
        }
    }
}

//결과 터치 이벤트
- (IBAction)onTouchUpInsideResultBtn:(UIButton *)sender{
    if(displyText.length > 0){
        [self operatingWithSecondNum:displyText.integerValue];
        
        [self.displyTextField setText:[NSString stringWithFormat:@"%zd", resultNum]];
        
        displyText = @"";
    }
}

//초기화 터치 이벤트
-(IBAction)onTouchUpInsideClearBtn:(id)sender
{
    //데이터초기화
    [self initData];
}

//*****************************************************
//* 연산함수
//*****************************************************
//덧셈연산자
-(void)oprationAdd:(NSInteger)secondNum
{
    resultNum = resultNum + secondNum;
}
//뺼셈연산자
-(void)operationSub:(NSInteger)secoundNum
{
    resultNum = resultNum - secoundNum;
}

//곱셈연산자
-(void)operationMulti:(NSInteger)secondNum
{
    resultNum = resultNum * secondNum;
}

//나눗셈연산자
-(void)operationDividing:(NSInteger) secondNum
{
    resultNum = resultNum / secondNum;
}

//*****************************************************
//* 그외 함수들
//*****************************************************

//데이터초기화
-(void)initData{
    
    resultNum = 0;
    operatorBuffer = @"";
    displyText = @"";
    
    [self.displyTextField setText:[NSString stringWithFormat:@"%zd",resultNum]];
}

//연산처리 함수
-(void) operatingWithSecondNum : (NSInteger) num
{
    if(operatorBuffer.length > 0){
        //더하기 연산
        if([operatorBuffer isEqualToString:@"+"]){
            [self oprationAdd:num];
            
            //빼기연산
        }else if([operatorBuffer isEqualToString:@"-"]){
            [self operationSub:num];
            
            //곱하기연산
        }else if([operatorBuffer isEqualToString:@"*"]){
            [self operationMulti:num];
            
            //나누기
        }else if([operatorBuffer isEqualToString:@"/"]){
            [self operationDividing:num];
            
        }else{
            NSLog(@"error");
        }
    }else{
        resultNum = num;
    }
}


@end
