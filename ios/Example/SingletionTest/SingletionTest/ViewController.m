//
//  ViewController.m
//  SingletionTest
//
//  Created by David June Kang on 2016. 6. 2..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;


@end

@implementation ViewController


- (IBAction)onTouchUpInsideButton :(id)sender{
    NSLog(@"-------------- 여기는 onTouchUpInsideButton입니다. -------------------");
    [[DataCenter sharedInstance]setName:self.nameTextField.text];
    [[DataCenter sharedInstance]printData];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"-------------- 여기는 viewWillAppear입니다. -------------------");
    [[DataCenter sharedInstance]printData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField.text = [DataCenter sharedInstance].name;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
