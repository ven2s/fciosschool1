//
//  ViewController.m
//  Test160527
//
//  Created by David June Kang on 2016. 5. 17..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"
#import "MyTestClass.h"

@interface ViewController ()

@end

@implementation ViewController


-(void) loadView{
    [super loadView];
    NSLog(@"First  View Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    MyTestClass *testObject = [[MyTestClass alloc]init];
    //viewDidLoad 메소스드가 끝나는 시점에서 testObejct가 메모리에서 해제됨
    
    NSLog(@"Break!!\n");
    
    NSLog(@"viewDidload will finish\n");
     
     */
    NSLog(@"First  View Controller viewDidLoad");
    
    
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"First  View Controller viewWillApper");
}


-(void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"First  View Controller viewWillLayoutSubviews");
    
}

-(void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"First  View Controller viewDidLayoutSubview");
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"First  View Controller viewWillDisappear");
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"First  View Controller viewDisappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"First  View Controller viewDidDisappear");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
@end
