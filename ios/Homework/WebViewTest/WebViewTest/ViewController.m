//
//  ViewController.m
//  WebViewTest
//
//  Created by David June Kang on 2016. 5. 27..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *earthImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *animation = self.earthImg;
    
    [self.earthImg setFrame:CGRectMake(animation.frame.origin.x+100, 150, 500, 150)];
    
    [UIImageView animateWithDuration:10.0
                          animations:^{
                            [self.earthImg setFrame:CGRectMake(-250, 150, 500, 150)];
                          }
                          completion:^(BOOL finished){
                              UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                              WebViewController *web = [storyBoard instantiateViewControllerWithIdentifier:@"WebView"];
                              
                              [self presentViewController:web animated:YES completion:nil];
                          }
    ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
