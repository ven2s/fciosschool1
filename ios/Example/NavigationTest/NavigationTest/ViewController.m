//
//  ViewController.m
//  NavigationTest
//
//  Created by David June Kang on 2016. 5. 31..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"
#import "ThirdViewController.h"


@interface ViewController ()
- (IBAction)nextButton:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButton:(UIButton *)sender {
    
    ThirdViewController *thridView = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thridView animated:YES];
}
@end
