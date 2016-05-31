//
//  ViewController.m
//  Exam_160526
//
//  Created by David June Kang on 2016. 5. 26..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic) UILabel *printLabel;
@property (nonatomic) UIButton *button;
@property (nonatomic) UIButton *button1;
@property (nonatomic) UIButton *button2;
@property (nonatomic) UIButton *button3;

@property (nonatomic, weak) UIButton *selectedBtn;

@property (nonatomic, weak) UITextField *textField1;
@property (nonatomic) UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1번버튼
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setFrame:CGRectMake(30, 150, 100, 35)];
    [button setTitle:@"1번" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    button.tag = 1;
    
    [self.view addSubview:button];
    self.button = button;
    
    
    //2번 버튼
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [button1 setFrame:CGRectMake(140, 150, 100, 35)];
    [button1 setTitle:@"2번" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button1 setTag:2];
    
    [self.view addSubview:button1];
    self.button1 = button1;
    
    
    //3번버튼
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [button2 setFrame:CGRectMake(30, 195, 100, 35)];
    [button2 setTitle:@"3번" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button2 setTag:3];
    
    [self.view addSubview:button2];
    self.button2 = button2;
    
    
    //4번버튼
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [button3 setFrame:CGRectMake(140, 195, 100, 35)];
    [button3 setTitle:@"4번" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button3 setTag:4];
    
    [self.view addSubview:button3];
    self.button3 = button3;

    //선택된 버튼 표시 레이블
    UILabel *printLabel = [[UILabel alloc]init];
    [printLabel setFrame:CGRectMake(70, 240, 200, 35)];
    [printLabel setText:@"선택된 버튼은 : "];
    [self.view addSubview:printLabel];
    self.printLabel = printLabel;
    
    //텍스트필드를 통해서 델리게이션을 구현해보자으!
    //<UITextFieldDelegate>를 상속 받고 시작
    //구현부 내부에서 TextField부분 구현
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(30, 290, 100, 40)];
    textField.placeholder = @"input text";
    textField.delegate = self;
    textField.borderStyle = UITextBorderStyleLine;
    
    [self.view addSubview:textField];
    
    
    //실습 : 텍스트필드 입력된 정보를 확인 버튼을 눌라 하단 라벨에 띄워주기(단, 리턴시 키보드 내려감)
    UITextField *textField1 = [[UITextField alloc]initWithFrame:CGRectMake(30, 420, 100, 40)];
    textField1.placeholder = @"input text";
    textField1.delegate = self;
    textField1.borderStyle = UITextBorderStyleLine;
    textField.tag = 1;
    
    [self.view addSubview:textField1];
    self.textField1 = textField1;

    UIButton *confirmButton = [[UIButton alloc]init];
    [confirmButton setFrame:CGRectMake(130, 420, 40, 40)];
    [confirmButton addTarget:self action:@selector(onTouchUpInsideBtnSecond:) forControlEvents:UIControlEventTouchUpInside];
    [confirmButton setTitle:@"확인" forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [confirmButton setTag:5];
    
    [self.view addSubview:confirmButton];
    
    UILabel *resultLable = [[UILabel alloc]initWithFrame:CGRectMake(30, 460, 140, 20)];
    [resultLable setText:@"결과 : "];
    [self.view addSubview:resultLable];
    self.resultLabel = resultLable;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//버튼 이벤트1
-(void) onTouchUpInsideBtn:(UIButton *) sender{
    
    self.selectedBtn.selected = (sender.selected ? YES : NO);
    sender.selected = (sender.selected ? NO : YES);
    
//    if(sender.selected){
//        self.selectedBtn.selected = YES;
//        sender.selected = NO;
//    }else{
//        self.selectedBtn.selected = NO;
//        sender.selected = YES;
//    }
    
    
    self.selectedBtn = sender;
    
    NSString *log ;
    
    switch (sender.tag) {
        case 1:
            log = @"1번";
            break;
        case 2:
            log = @"2번";
            break;
        case 3:
            log = @"3번";
            break;
        case 4:
           log = @"4번";
            break;
    }
    
    [self.printLabel setText:[NSString stringWithFormat:@"선택된 버튼은 : %@",log]];
    
}


//텍스트 필드가 리턴키 키보드를 내리게 한다.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"call textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"call textFieldShouldBeginEditing");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"call textFieldDidBeginEditing");
}

//확인버튼 이벤트
- (void) onTouchUpInsideBtnSecond:(UIButton *)sender{
    if(!self.textField1.resignFirstResponder){
        if(![self.textField1.text isEqualToString:@""]){
            [self.resultLabel setText:[NSString stringWithFormat:@"%@ %@", @"결과 : ", self.textField1.text]];
        }
    }
}

@end
