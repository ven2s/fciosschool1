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
#import "MasterViewController.h"


@interface ViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailId;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registorButton;
@property (nonatomic) UITextField *targetTextField;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@property (weak, nonatomic) IBOutlet UIButton *securityButton;

- (IBAction)onTouchUpInsideButton:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    [self redrawLoginView];
   // [self checkAutoLogin];
}

- (void) checkAutoLogin{
    self.emailId.text = [[DataCenter sharedInstance]autoLoginToString];
    if([[DataCenter sharedInstance]autoLogin]){
        
        [self performSegueWithIdentifier:@"LOGIN_TO_MAIN" sender:self];
    }
}

//로그인View 다시 그리기 (배경색을 alpha값을 내리기 위해서
- (void) redrawLoginView{
    
    CGSize size = CGSizeMake(self.loginView.frame.size.width, self.loginView.frame.size.height);
    
    //로그인뷰 배경화면
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    bgView.alpha = 0.33;
    
    [self.loginView addSubview:bgView];
    
    
    UITextField *emailId = self.emailId;
    emailId.delegate = self;
    [self.loginView addSubview:emailId];
    
    UITextField *password = self.password;
    password.delegate = self;
    [self.loginView addSubview:password];
    
    UIButton *loginButton = self.loginButton;
    [self.loginView addSubview:loginButton];
    
    UIButton *registorButton = self.registorButton;
    [self.loginView  addSubview:registorButton];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    [self checkAutoLogin];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag == 1){
        self.password.selected = YES;
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
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
        
        //자동로그인일 경우 
        if([dataCenter autoLogin]){
            return YES;
        }
        
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
            [self showMsg:@"가입된 회원이 아니거나 계정정보를 다시 확인 하십시오."];
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
        
        DataCenter *dataCenter = [DataCenter sharedInstance];
        
        [dataCenter setAutoLogin:YES email:self.emailId.text];
    }
}




- (IBAction)onTouchUpInsideButton:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
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
    
    if(sender.tag == 4){
        if([self.emailId.text isEqualToString:@"master@do.com"]){
            DataCenter *dataCenter = [DataCenter sharedInstance];
            
            if([dataCenter isUser:self.emailId.text passwd:self.password.text]){
                [self showMsg:@"환영 합니다. 관리자님"];
                MasterViewController *masterViewController = [storyBoard instantiateViewControllerWithIdentifier:@"MASTER_PAGE"];
                [self presentViewController:masterViewController animated:YES completion:nil];
            }else{
                [self showMsg:@"접근할수 없습니다"];
                
            }
        }
        
    }
}

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
@end
