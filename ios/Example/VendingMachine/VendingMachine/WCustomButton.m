//
//  WCustomButton.m
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "WCustomButton.h"

@interface WCustomButton()

@property (nonatomic, weak) UIImageView *drinkImg;
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UILabel *costLB;
@property (nonatomic, weak) UIButton *actionBtn;

@end

@implementation WCustomButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (void) createView{
    UIImageView *drinkImg = [[UIImageView alloc]init];
    [self addSubview:drinkImg];
    self.drinkImg = drinkImg;
    
    UILabel *titleLB = [[UILabel alloc]init];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.textColor = [UIColor blackColor];
    titleLB.font = [UIFont systemFontOfSize:15];
    [self addSubview:titleLB];
    self.titleLB = titleLB;
    
    
    UILabel *costLB = [[UILabel alloc]init];
    costLB.textAlignment = NSTextAlignmentRight;
    costLB.textColor = [UIColor orangeColor];
    costLB.font = [UIFont systemFontOfSize:15];
    [self addSubview:costLB];
    self.costLB = costLB;
    
    
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn addTarget:self action:@selector(onTouchupInsideActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionBtn];
    self.actionBtn = actionBtn;
    
}

- (void) updateLayout{
    
    [self.drinkImg setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 22)];
    [self.titleLB setFrame:CGRectMake(0, self.frame.size.height - 22, self.frame.size.width/2, 22)];
    [self.costLB setFrame:CGRectMake(70, self.frame.size.height - 22, self.frame.size.width/2, 22)];
    [self.actionBtn setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}


- (void)setTitle:(NSString *)title{
    [self.titleLB setText:title];
}

- (void)setCost:(NSString *)cost{
    [self.costLB setText:cost];
}

- (void)setImageWithName:(NSString *)imageName{
    [self.drinkImg setImage:[UIImage imageNamed:imageName]];
}

/************************
 * Action
 ************************/
-(void)onTouchupInsideActionBtn : (UIButton *)sender{
    if([self.delegate respondsToSelector:@selector(didSelectWCustomButton:)]){
        [self.delegate didSelectWCustomButton:self];
    }
}

@end
