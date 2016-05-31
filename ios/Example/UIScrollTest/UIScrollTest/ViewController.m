//
//  ViewController.m
//  UIScrollTest
//
//  Created by David June Kang on 2016. 5. 27..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //스크롤뷰에 보일 컨텐츠사이즈를 지정
    CGSize contentSize = CGSizeMake(320, 460);
    
    //스크롤뷰 설정
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    [scrollView setContentSize:CGSizeMake(contentSize.width*3, contentSize.height)];
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    scrollView.bounces = NO;
    
    [self.view addSubview:scrollView];
    
    CGFloat offsetX = 0;
    
    //스크롤뷰에 들어갈 컨텐츠(이미지뷰 추가)
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(offsetX, 0, contentSize.width, contentSize.height)];
    [imageView1 setBackgroundColor:[UIColor blueColor]];
    [scrollView addSubview:imageView1];
    
    offsetX+=contentSize.width;;
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(offsetX, 0, contentSize.width, contentSize.height)];
    [imageView2 setBackgroundColor:[UIColor greenColor]];
    [scrollView addSubview:imageView2];
    
    offsetX+=contentSize.width;;
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(offsetX, 0, contentSize.width, contentSize.height)];
    [imageView3 setBackgroundColor:[UIColor redColor]];
    [scrollView addSubview:imageView3];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
