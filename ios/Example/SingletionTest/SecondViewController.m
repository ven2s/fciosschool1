//
//  SecondViewController.m
//  SingletionTest
//
//  Created by David June Kang on 2016. 6. 2..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "SecondViewController.h"
#import "DataCenter.h"

@interface SecondViewController ()

@property (nonatomic, weak) IBOutlet UITextField *ageTextField;

@end

@implementation SecondViewController


- (IBAction)onTouchUpInsideButton :(id)sender{
    NSLog(@"-------------- 여기는 Second onTouchUpInsideButton입니다. -------------------");
    [[DataCenter sharedInstance]setAge:self.ageTextField.text.intValue];
    [[DataCenter sharedInstance]printData];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"-------------- 여기는 Second viewWillAppear입니다. -------------------");
    [[DataCenter sharedInstance]printData];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.ageTextField.text = [NSString stringWithFormat:@"%ld",[DataCenter sharedInstance].age];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
