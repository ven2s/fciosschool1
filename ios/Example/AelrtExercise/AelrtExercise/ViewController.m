//
//  ViewController.m
//  AelrtExercise
//
//  Created by David June Kang on 2016. 6. 10..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
- (IBAction)clickAlertButton:(id)sender {
    NSLog(@"call clickAlertButton");
    UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"확인"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nullable action){
                                                          NSLog(@"OK Click");
                                                      
                                                      }];
    UIAlertAction *destructiveAction  = [UIAlertAction actionWithTitle:@"파괴"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * _Nullable action){
                                                              NSLog(@"Destructive Click");
                                                              
                                                          }];

    
    
    UIAlertAction *cancleAction  = [UIAlertAction actionWithTitle:@"취소"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * _Nullable action){
                                                          NSLog(@"cancle Click");
                                                          
                                                      }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                                                             message:@"Alert Style"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:okAction];
    [alertController addAction:destructiveAction]; //무조건 중간에 들어감
    [alertController addAction:cancleAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setBackgroundColor:[UIColor blueColor]];
    }];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (IBAction)clickActionSheetButton:(id)sender {
    NSLog(@"call clickActionSheetButton");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                                                             message:@"Alert Style"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    

}
@end
