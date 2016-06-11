//
//  KVOViewController.m
//  PropertyAndKVO
//
//  Created by David June Kang on 2016. 6. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "KVOViewController.h"
@import AVFoundation;


@interface KVOViewController ()

@property (nonatomic) NSInteger count;
@property (weak, nonatomic) IBOutlet UILabel *showDiplay;


@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.count = 1;
    //Observer가 감지를 count라는 프로퍼티의 변경점을 감지를 하는옵션
    [self addObserver:self
           forKeyPath:@"count"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    
    NSURL *path = [[NSBundle mainBundle] URLForResource:@"sound" withExtension:@"mp3"];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:path error:nil];
    
    
    
    [self addObserver:self.player forKeyPath:@"rate" options:NSKeyValueObservingOptionNew context:nil];
    
}

//등록해놓은 변화를 감지를 하는 메서드
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@",change);
    
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    [self.showDiplay setText:[NSString stringWithFormat:@"%@",newValue]];
    
    NSLog(@"Kind : %@, New : %@",kindValue, newValue);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)increaseValueButton:(id)sender{
    //self.count++;
    [self.player play];
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
