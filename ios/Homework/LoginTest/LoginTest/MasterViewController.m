//
//  MasterViewController.m
//  LoginTest
//
//  Created by David June Kang on 2016. 6. 7..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "MasterViewController.h"
#import "DataCenter.h"
@interface MasterViewController () 
@property (nonatomic, strong) NSString *managerId;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createView{

    CGSize sreenSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    UIView *uiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, sreenSize.width, sreenSize.height)];
    
    
    [self.view addSubview:uiView];
    
  //  DataCenter *dataCenter = [DataCenter sharedInstance];
    
    
    
    
    
    
    
}

@end
