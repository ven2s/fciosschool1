//
//  CodeViewController.m
//  NavigationTest
//
//  Created by David June Kang on 2016. 5. 31..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "CodeViewController.h"
#import "ViewController.h"
@interface CodeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setToolbarHidden:NO];
    [self createView];
     // Do any additional setup after loading the view from its nib.
}

-(void) createView{
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"First",@"Second", @"Thrid", nil]];
    
    [segmentControl addTarget:self action:@selector(segementAction:) forControlEvents:UIControlEventValueChanged];
    segmentControl.frame = CGRectMake(0, 0, 120, 35);
    //    segmentControl.segmentedControlStyle = UISegtmentedControlStyleBar;
    segmentControl.momentary = YES;
    
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc]initWithCustomView:segmentControl];
    
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    
    [self.navigationItem setTitle:@"JJJJJJ"];
    
    
    
    //Custom ToolBar
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UISegmentedControl *sortToggle = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"Ascending", @"Decending", nil]];
    sortToggle.selectedSegmentIndex = 0;
    [sortToggle addTarget:self action:@selector(toggleSorting:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *sortToggleButtonItem = [[UIBarButtonItem alloc]initWithCustomView:sortToggle];
    self.toolbarItems = [NSArray arrayWithObjects:flexibleSpaceItem, sortToggleButtonItem, flexibleSpaceItem, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) segementAction:(UISegmentedControl *)sender{
    

}

-(void) toggleSorting:(UISegmentedControl *)sender{
    
}


//화면전환테스트
-(IBAction)nextButton:(UIButton *)sender{
    //다음화면 이동
    //1. 객체생성
    //CodeViewController는 StoryBoard내에 없기 때문에 생성을한다.
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"MainVC"];
    
    //2. push
    [self.navigationController pushViewController:vc animated:YES];

}

@end
