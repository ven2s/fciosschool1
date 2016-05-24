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
@property (nonatomic, weak) UILabel *titleLable;
@property (nonatomic, weak) UILabel *costLable;
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
    
    UILabel *titleLable = [[UILabel alloc]init];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:15];
    [self addSubview:titleLable];
    self.titleLable = titleLable;
    
    
    UILabel *costLable = [[UILabel alloc]init];
    costLable.textAlignment = NSTextAlignmentRight;
    costLable.textColor = [UIColor orangeColor];
    costLable.font = [UIFont systemFontOfSize:15];
    [self addSubview:costLable];
    self.costLable = costLable;
    
    
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn addTarget:self action:@selector(onTouchupInsideActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionBtn];
    self.actionBtn = actionBtn;
    
}

- (void) updateLayout{
    
    [self.drinkImg setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 22)];
    [self.titleLable setFrame:CGRectMake(0, self.frame.size.height - 22, self.frame.size.width/2, 22)];
    [self.costLable setFrame:CGRectMake(70, self.frame.size.height - 22, self.frame.size.width/2, 22)];
    [self.actionBtn setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}


- (void)setTitle:(NSString *)title{
    [self.titleLable setText:title];
}

- (void)setCost:(NSString *)cost{
    [self.costLable setText:cost];
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
