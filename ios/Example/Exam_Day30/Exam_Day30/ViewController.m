//
//  ViewController.m
//  Exam_Day30
//
//  Created by David June Kang on 2016. 6. 3..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *constDictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    [constDictionary setObject:@"강준" forKey:@"name"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:constDictionary options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", jsonString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) showAlert:(UIButton * )sender{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"여러분"
//                                                       message:@"뭐에요?"
//                                                      delegate:self
//                                             cancelButtonTitle:@"네니요"
//                                             otherButtonTitles:@"네", nil];
//    [self.view addSubview:alertView];
//
    
    
    id block = ^(UIAlertAction * _Nonnull action){
        if([action.title isEqualToString:@"예"]){
            
        }else{
            
        }
    };

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"여러분" message:@"뭐에요?" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"예" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"맞다고 하네요");
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"네니요" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"쏘왓!");
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:noAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
