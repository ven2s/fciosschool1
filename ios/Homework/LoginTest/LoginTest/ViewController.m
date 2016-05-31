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


@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailId;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registorButton;
- (IBAction)onTouchUpInsideButton:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag == 1){
        self.password.selected = YES;
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (IBAction)onTouchUpInsideButton:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if(sender.tag == 1){
        NSString *string = self.emailId.text;
        NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
        NSError *error = NULL;
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
        
        if (match){
            if(self.password.text.length < 8){
                [self.password setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
                self.password.selected = YES;
            }else{
                RegistorViewController *regView = [storyBoard instantiateViewControllerWithIdentifier:@"Registor"];
                [self presentViewController:regView animated:YES completion:nil];
            }
        }else{
            [self.emailId setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
            self.emailId.selected = YES;
        }
    }else{
        
    }
}
@end
