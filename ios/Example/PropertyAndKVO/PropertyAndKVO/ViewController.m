//
//  ViewController.m
//  PropertyAndKVO
//
//  Created by David June Kang on 2016. 6. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showDiplay;


-(IBAction)increaseValueButton:(id)sender;

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
-(IBAction)increaseValueButton:(id)sender{
    //self.count += 1;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(increaseCount) userInfo:nil repeats:YES];
}

- (void) setCount:(NSInteger)count{
    _count = count;
    NSLog(@"Set Count : %ld",self.count);
    [_showDiplay setText:[NSString stringWithFormat:@"%ld",_count]];
}

-(void)increaseCount{
    self.count++;
}

@end
