//
//  SecondViewController.m
//  Test160527
//
//  Created by David June Kang on 2016. 5. 17..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


-(void) loadView{
    [super loadView];
    NSLog(@"Second View Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Second View Controller viewDidLoad");
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"Second View Controller viewWillApper");
}


-(void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"Second View Controller viewWillLayoutSubviews");
    
}

-(void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"Second View Controller viewDidLayoutSubview");
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"Second View Controller viewWillDisappear");
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Second View Controller viewDisappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"Second View Controller viewDidDisappear");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) onTouchupInsideCloseBtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) dealloc{
    NSLog(@"Second View Controller dealloc\n\n");
}
@end
