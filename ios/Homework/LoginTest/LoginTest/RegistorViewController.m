//
//  RegistorViewController.m
//  LoginTest
//
//  Created by David June Kang on 2016. 5. 27..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "RegistorViewController.h"



@interface RegistorViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *passWordConfirm;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *realName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *registorButton;

@end

@implementation RegistorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"call textFieldDidEndEditing %ld",textField.tag);
    if(textField.tag == 3){
        if(![self.passWord.text isEqualToString:textField.text]){
            [textField setBackgroundColor:UIColorFromRGB(0xFFB1BC)];
        }
    }else if(textField.tag == 2){
        if(textField.text.length < 8){
            //메세지
            
        }
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
      return YES;
}
@end
