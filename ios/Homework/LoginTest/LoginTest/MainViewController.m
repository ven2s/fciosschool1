//
//  MainViewController.m
//  LoginTest
//
//  Created by David June Kang on 2016. 5. 31..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "MainViewController.h"
#import "DataCenter.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITextView *showUserInfo;

@end



@implementation MainViewController

@synthesize userId;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    DataCenter *dataCenter = [DataCenter sharedInstance];
    
    self.showUserInfo.text = [dataCenter showUserInfo:self.userId];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"RETURN_TO_MAIN"]){
        
    }else if([[segue identifier] isEqualToString:@"LOGOUT_TO_MAIN"]){
       [[DataCenter sharedInstance]setAutoLogin:NO];
    }
}
@end
