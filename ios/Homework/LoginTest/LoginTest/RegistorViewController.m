//
//  RegistorViewController.m
//  LoginTest
//
//  Created by David June Kang on 2016. 5. 27..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "RegistorViewController.h"
#import "MainViewController.h"
#import "DataCenter.h"


@interface RegistorViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *email;            //이메일
@property (weak, nonatomic) IBOutlet UITextField *passWord;         //비밀번호
@property (weak, nonatomic) IBOutlet UITextField *passWordConfirm;  //확인란
@property (weak, nonatomic) IBOutlet UITextField *nickName;         //별명
@property (weak, nonatomic) IBOutlet UITextField *realName;         //이름
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;    //성별
@property (weak, nonatomic) IBOutlet UITextView *textView;          //회원약관
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;         //동의버튼
@property (weak, nonatomic) IBOutlet UIButton *registorButton;      //회원가입버튼

@property (nonatomic) UITextField *targetTextField;                 //Validation용

- (IBAction)onTouchUpInsideButton:(UIButton *)sender;


@end

@implementation RegistorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}


-(void) createView{
    self.navigationController.navigationBarHidden = NO;
    [self.agreeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//텍스트 필드 입력이 종료시 이벤트
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"call textFieldDidEndEditing %ld",textField.tag);
    [self.targetTextField setBackgroundColor:[UIColor whiteColor]];
    if(textField.tag == 3){
        if(![self.passWord.text isEqualToString:textField.text]){
            
            [textField setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
            self.targetTextField = textField;
            
        }
    }else if(textField.tag == 2){
        if(textField.text.length < 8){
            //메세지
            [textField setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
            [self showMsg:@"비밀번호는 8자 이상입니다"];
            self.targetTextField = textField;
        }
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
      return YES;
}

//버튼 이벤트
- (IBAction)onTouchUpInsideButton:(UIButton *)sender {
    if(sender.tag == 1){
        if(!sender.selected){
            sender.selected = YES;
        }else{
            sender.selected = NO;
        }
    }
}

//버튼을 누를경우 여부에 따른 Validation
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if(![self isCheckAll]){
        return NO;
    }
    
    if([identifier isEqualToString:@"REG_TO_MAIN"]){
        if(![self isCheckAll]){
            return NO;
        }
        if(!self.agreeButton.selected){
            [self showMsg:@"동의버튼을 누르지 않으셨습니다"];
            return NO;
        }
    }
    
    DataCenter *dataCenter = [DataCenter sharedInstance];
    BOOL isAdded = [dataCenter addEmail:self.email.text
                  passwd:self.passWord.text
                nickName:self.nickName.text
                realName:self.realName.text
                  gender:(self.gender.selectedSegmentIndex == 0 ? @"남자" : @"여자")];
    
    if(!isAdded){
        [self showMsg:@"이미 존재 하는 회원입니다"];
        return NO;
    }
    
    return YES;
}

//이동시 확정시 값은 전달해준다
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"REG_TO_MAIN"]){
        MainViewController *mainView = [segue destinationViewController];
        [mainView setUserId:self.email.text];
    }
}


//입력값을 빈공간을 체크한다.
-(BOOL) isCheckAll{
    
    [self.targetTextField setBackgroundColor:[UIColor whiteColor]];
    
    //이메일 체크(공백, 이메일 형식)
    if([self.email.text isEqualToString:@""]){
        [self showMsg:@"이메일을 입력하여 주십시오"];
        self.email.selected = YES;
        [self.email setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
        return NO;
    }else{
        NSString *string = self.email.text;
        NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
        NSError *error = NULL;
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
        
        [self.targetTextField setBackgroundColor:[UIColor whiteColor]];
        
        if (!match){
            [self showMsg:@"이메일 형식이 맞지 않습니다"];
            [self.email setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
            self.targetTextField = self.email;
            self.email.selected = YES;
            return NO;
        }
        
    }
    
    //비빌번호체크(8자이상체크, 확인란과 일치여부 확인)
    if(self.passWord.text.length < 8){
        //메세지
        [self.passWord setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
        [self showMsg:@"비밀번호는 8자 이상입니다"];
        self.targetTextField = self.passWord;
       return NO;
    }
    
    if(![self.passWord.text isEqualToString:self.passWordConfirm.text]){
        
        [self.passWordConfirm setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
        self.targetTextField = self.passWordConfirm;
        return NO;
    }

    //별명 체크(입력체크)
    if([self.nickName.text isEqualToString:@""]){
        [self.nickName setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
        self.targetTextField = self.nickName;
        return NO;
    }
    
    //이름 체크(입력여부체크)
    if([self.realName.text isEqualToString:@""]){
        [self.realName setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
        self.targetTextField = self.realName;
        return NO;
    }
    
    return YES;
}

//메세지를 띄운다.
- (void) showMsg:(NSString *)message{
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"알림창"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nullable action){
                                                         [alertController dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    
    
    
    [alertController addAction:okButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

//텍스트필드 리턴버튼 누를시 키보드 내려가도록 바꿈
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
