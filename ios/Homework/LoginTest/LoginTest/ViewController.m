//
//  ViewController.m
//  LoginTest
//
//  Created by David June Kang on 2016. 5. 21..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"
#import "RegistorViewController.h"
#import "MainViewController.h"
#import "DataCenter.h"


@interface ViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailId;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registorButton;
@property (nonatomic) UITextField *targetTextField;

- (IBAction)onTouchUpInsideButton:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag == 1){
        self.password.selected = YES;
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
}

-(BOOL) isCheckLoginWithID:(NSString *)userID userPassword:(NSString *)userPassword{
    
    
    return NO;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if([identifier isEqualToString:@"LOGIN_TO_MAIN"]){
        NSString *string = self.emailId.text;
        NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
        NSError *error = NULL;
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
        
        DataCenter *dataCenter = [DataCenter sharedInstance];
        
        [self.targetTextField setBackgroundColor:[UIColor whiteColor]];
        
        if (!match){
            [self showMsg:@"이메일 형식이 맞지 않습니다"];
            [self.emailId setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
            self.targetTextField = self.emailId;
            self.emailId.selected = YES;
            return NO;
        }
        
        if(self.password.text.length < 8){
            [self showMsg:@"비밀번호 8자리 이상이어야 합니다."];
            [self.password setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
            self.targetTextField = self.password;
            self.password.selected = YES;
            return NO;
        }
        
        //20160605 로그인 대상 체크
        if(![dataCenter isUser:self.emailId.text passwd:self.password.text]){
            [self showMsg:@"가입된 회원이 아닙니다."];
            return NO;
        }
        
    }
    
    return YES;
}

//이동이 정해진후
//메인화면으로 이동시 메인 객체에 ID전달

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"LOGIN_TO_MAIN"]){
        MainViewController *mainView = [segue destinationViewController];
        [mainView setUserId:self.emailId.text];
    }
}


//
//
//- (IBAction)onTouchUpInsideButton:(UIButton *)sender {
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    [self.targetTextField setBackgroundColor:[UIColor whiteColor]];
//    if(sender.tag == 1){
//        NSString *string = self.emailId.text;
//        NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
//        NSError *error = NULL;
//        
//        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
//        
//        NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
//        
//        if (match){
//            if(self.password.text.length < 8){
//                [self showMsg:@"비밀번호 8자리 이상이어야 합니다."];
//                [self.password setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
//                self.targetTextField = self.password;
//                self.password.selected = YES;
//            }else{
//                MainViewController *mainView = [storyBoard instantiateViewControllerWithIdentifier:@"MainView"];
//                //[self presentViewController:regView animated:YES completion:nil];
//                [self.navigationController pushViewController:mainView animated:YES];
//            }
//        }else{
//            [self showMsg:@"이메일 형식이 맞지 않습니다"];
//            [self.emailId setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
//            self.targetTextField = self.emailId;
//            self.emailId.selected = YES;
//        }
//    }else{
//        RegistorViewController *regView = [storyBoard instantiateViewControllerWithIdentifier:@"Registor"];
//        [self presentViewController:regView animated:YES completion:nil];
//
//    }
//}

- (void) showMsg:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc]init];
    alert.message = message;
    [alert addButtonWithTitle:@"확인"];
    
    [alert show];
}
@end
