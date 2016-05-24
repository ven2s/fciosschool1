//
//  ViewController.m
//  UITest
//
//  Created by David June Kang on 2016. 5. 24..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //기본 사용법
//    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 300, 400)];
//    
//    [testView setBackgroundColor:[UIColor orangeColor]];
//    
//    UIColor *bgColor = [[UIColor alloc]initWithRed:255/255 green:100/255 blue:120/255 alpha:1];
//    
//    [testView setBackgroundColor:bgColor];
//    
//    [self.view addSubview:testView];
    
    //실습 1  ㄴ ㄱ 설정
//    const CGFloat VIEW_HALF_WIDTH = self.view.frame.size.width/2;
//    
//    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
//    [leftView setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:leftView];
//
//    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];
//    [topView setBackgroundColor:[UIColor blueColor]];
//    [leftView addSubview:topView];
//    
//    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(VIEW_HALF_WIDTH, 0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
//    [rightView setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:rightView];
//
//    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, rightView.frame.size.height-VIEW_HALF_WIDTH, VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];;
//    [bottomView setBackgroundColor:[UIColor redColor]];
//    [rightView addSubview:bottomView];
    
    
    //실습2
//    const CGFloat MARGIN = 20.0;
//    
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(MARGIN, MARGIN, self.view.frame.size.width-MARGIN*2, self.view.frame.size.height-MARGIN*2)];
//    
//    [view1 setBackgroundColor:[UIColor blackColor]];
//    
//    [self.view addSubview:view1];
//    
//    UIView *viewInside = [[UIView alloc]initWithFrame:CGRectMake(MARGIN, MARGIN, view1.frame.size.width-MARGIN*2, view1.frame.size.height-MARGIN*2)];
//    [viewInside setBackgroundColor:[UIColor yellowColor]];
//    [view1 addSubview:viewInside];
    
    //실습3 : UILable
//    const CGFloat MARGIN = 20.0;
//    CGSize labelSize = CGSizeMake(self.view.frame.size.width-MARGIN*2, 30);
//    
//    CGFloat yPoint = MARGIN;
//    
//    CGFloat heightSize = labelSize.height;
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
//    [self.view addSubview:view];
//
//    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(MARGIN, yPoint, view.frame.size.width-(MARGIN*2), heightSize)];
//    [lable1 setText:@"예제 화면 입니다."];
//    [lable1 setTextColor:[UIColor blackColor]];
//    [lable1 setTextAlignment:NSTextAlignmentLeft];
//    [view addSubview:lable1];
//    
//    yPoint+=MARGIN;
//    
//    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(MARGIN, yPoint, view.frame.size.width-(MARGIN*2), heightSize)];
//    [lable2 setText:@"예쁜레이블 입니다."];
//    [lable2 setTextColor:[UIColor redColor]];
//    [lable2 setTextAlignment:NSTextAlignmentRight];
//    [view addSubview:lable2];
//    
//    yPoint+=MARGIN;
//    
//    UIView *viewInside = [[UIView alloc]initWithFrame:CGRectMake(MARGIN, yPoint, view.frame.size.width-MARGIN*10, view.frame.size.height-(MARGIN*10))];
//    
//    [viewInside setBackgroundColor:[UIColor blackColor]];
//    [view addSubview:viewInside];
//    {
//        UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(0, viewInside.frame.size.height-MARGIN, viewInside.frame.size.width, heightSize)];
//        [lable3 setText:@"View위에 레이블 입니다."];
//        [lable3 setTextColor:[UIColor whiteColor]];
//        [lable3 setTextAlignment:NSTextAlignmentRight];
//        [viewInside addSubview:lable3];
//    }
//    
//    yPoint += viewInside.frame.size.height;
//    
//    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake(MARGIN, yPoint, view.frame.size.width, heightSize)];
//    [lable4 setText:@"중앙에 있는 레이블 입니다."];
//    [lable4 setTextColor:[UIColor blackColor]];
//    [lable4 setTextAlignment:NSTextAlignmentCenter];
//    [view addSubview:lable4];
//    
//    yPoint+=MARGIN;
//    
//    UILabel *lable5 = [[UILabel alloc]initWithFrame:CGRectMake(MARGIN, yPoint, view.frame.size.width, heightSize)];
//    [lable5 setText:@"폰트는 20입니다."];
//    [lable5 setTextColor:[UIColor blackColor]];
//    [lable5 setTextAlignment:NSTextAlignmentCenter];
//    lable5.font=[lable5.font fontWithSize:20];
//    [view addSubview:lable5];

    
    //실습 4 UIImageView
    CGSize imageSize = CGSizeMake(999/3, 381/3);
    NSString *fileName = @"cokeLogo.png";
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, imageSize.width, imageSize.height+100)];
    [imageView setImage:[UIImage imageNamed:fileName]];
    //[imageView setContentMode:UIViewContentModeScaleAspectFill];
    //[imageView setContentMode:UIViewContentModeScaleToFill];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
