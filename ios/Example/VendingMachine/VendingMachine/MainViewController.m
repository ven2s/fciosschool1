//
//  MainViewController.m
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "MainViewController.h"
#import "WCustomButton.h"
#import "DrinkObject.h"
#import "TrayBox.h"
#import "Casher.h"


@interface MainViewController () <WCustomButtonDelegate>

//메뉴영역
@property (nonatomic, weak) UIView *menuView;

//500원 추가영역
@property (nonatomic, weak) UIView *input500CoinArea;
@property (nonatomic, weak) UILabel *title500CoinLB;
@property (nonatomic, weak) UIButton *add500CoinBtn;

//100원 추가영역
@property (nonatomic, weak) UIView *input100CoinArea;
@property (nonatomic, weak) UILabel *title100CoinLB;
@property (nonatomic, weak) UIButton *add100CoinBtn;

//돈컨트롤(잔액,반환버튼)
@property (nonatomic, weak) UIView *moneyControllArea;
@property (nonatomic, weak) UILabel *moneyTitleLB;
@property (nonatomic, weak) UITextField *remainMoneyShowTF;
@property (nonatomic, weak) UIButton *moneyChangeBtn;

//상태화면표시
@property (nonatomic, weak) UITextView *displayView;

//메뉴부분 객체를 가진 배열
@property (nonatomic) NSMutableArray *drinkBtnList;


@property (nonatomic) TrayBox *trayBox;
@property (nonatomic) Casher *casher;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drinkBtnList = [[NSMutableArray alloc] initWithCapacity:4];
    self.trayBox = [[TrayBox alloc]init];
    self.casher = [[Casher alloc]init];
    [self createView];
    [self updateLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UI객체 생성
- (void) createView{
    
    UIColor *areaColor = [UIColor clearColor];
    
    UIView *menuView = [[UIView alloc]init];
    [menuView setBackgroundColor:areaColor];
    [self.view addSubview:menuView];
    self.menuView = menuView;
    {
        for(int i=0; i<maximumDrinkCount; i++){

            DrinkObject *drinkData = [self.trayBox.drinkKinds objectAtIndex:i];
            
            WCustomButton *drinkBtn =[[WCustomButton alloc]init];
            [drinkBtn setBackgroundColor:[UIColor clearColor]];
            drinkBtn.tag = i;

//            NSLog(@"%@",drinkData.name);
            
            [drinkBtn setTitle:drinkData.name];
            [drinkBtn setCost:[NSString stringWithFormat:@"%ld원",drinkData.cost]];
            drinkBtn.delegate = self;
            [drinkBtn setImageWithName:[NSString stringWithFormat:@"drink%d",i+1]];
            [menuView addSubview:drinkBtn];
            
            [self.drinkBtnList addObject:drinkBtn];
        }
    }

    UIView *input500CoinArea = [[UIView alloc]init];
    [input500CoinArea setBackgroundColor:areaColor];
    [self.view addSubview:input500CoinArea];
    self.input500CoinArea = input500CoinArea;
    {
        UILabel *title500CoinLB = [[UILabel alloc]init];
        title500CoinLB.text = @"500원";
        title500CoinLB.textColor = [UIColor blackColor];
        title500CoinLB.textAlignment = NSTextAlignmentRight;
        [input500CoinArea addSubview:title500CoinLB];
        self.title500CoinLB = title500CoinLB;
        
        UIButton *add500CoinBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
                                   
        add500CoinBtn.tag = 500;
        [add500CoinBtn addTarget:self action:@selector(onTouchupInsideAddCoin:) forControlEvents:UIControlEventAllEvents];
        [input500CoinArea addSubview:add500CoinBtn];
        self.add500CoinBtn = add500CoinBtn;
    }

    UIView *input100CoinArea = [[UIView alloc]init];
    [input100CoinArea setBackgroundColor:areaColor];
    [self.view addSubview:input100CoinArea];
    self.input100CoinArea = input100CoinArea;
    {
        UILabel *title100CoinLB = [[UILabel alloc]init];
        title100CoinLB.text = @"100원";
        title100CoinLB.textColor = [UIColor blackColor];
        title100CoinLB.textAlignment = NSTextAlignmentRight;
        [input100CoinArea addSubview:title100CoinLB];
        self.title100CoinLB = title100CoinLB;
        
        UIButton *add100CoinBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        add100CoinBtn.tag = 100;
        [add100CoinBtn addTarget:self action:@selector(onTouchupInsideAddCoin:) forControlEvents:UIControlEventAllEvents];
        [input100CoinArea addSubview:add100CoinBtn];
        self.add100CoinBtn = add100CoinBtn;

    }
    
    UIView *moneyControllArea = [[UIView alloc]init];
    [moneyControllArea setBackgroundColor:areaColor];
    [self.view addSubview:moneyControllArea];
    self.moneyControllArea = moneyControllArea;
    {
        UILabel *moneyTitleLB = [[UILabel alloc]init];
        moneyTitleLB.text = @"Money";
        moneyTitleLB.textColor = [UIColor blackColor];
        moneyTitleLB.font =[UIFont systemFontOfSize:15];
        [moneyControllArea addSubview:moneyTitleLB];
        self.moneyTitleLB = moneyTitleLB;
        
        
        UITextField *remainMoneyShowTF = [[UITextField alloc]init];
        remainMoneyShowTF.userInteractionEnabled = NO;
        remainMoneyShowTF.borderStyle = UITextBorderStyleLine;
        remainMoneyShowTF.textAlignment = NSTextAlignmentCenter;
        [moneyControllArea addSubview:remainMoneyShowTF];
        self.remainMoneyShowTF = remainMoneyShowTF;

        
        UIButton *moneyChangeBtn = [[UIButton alloc]init];
        [moneyChangeBtn setTitle:@"반환" forState:UIControlStateNormal];
        [moneyChangeBtn addTarget:self action:@selector(onTouchupInsideMoneyChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [moneyChangeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [moneyChangeBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [moneyControllArea addSubview:moneyChangeBtn];
        self.moneyChangeBtn = moneyChangeBtn;
        
    }
    
    UITextView *displayView = [[UITextView alloc]init];
    [displayView setBackgroundColor:[UIColor grayColor]];
    [displayView setTextColor:[UIColor whiteColor]];
    displayView.editable = NO;
    [self.view addSubview:displayView];
    self.displayView = displayView;
    
}

//UI 레이아웃 수정
- (void) updateLayout{
    
    const CGFloat SIDE_MARGIN = 30.f;
    NSInteger offsetY = 20; //가장 위의 상태바가 20px
    
    [self.menuView setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN * 2, 370)];
    offsetY += self.menuView.frame.size.height + 10;
    {
        CGSize drinkBtnSize = CGSizeMake(140, 175);
        for(int i=0; i<self.drinkBtnList.count; i++){
            NSInteger row = i/2;
            NSInteger col = i%2;
            
            WCustomButton *drinkBtn = self.drinkBtnList[i];
            [drinkBtn setFrame:(CGRectMake(10 + (col*drinkBtnSize.width) + (col*15), row*drinkBtnSize.height + (row*20), drinkBtnSize.width, drinkBtnSize.height))];
            [drinkBtn updateLayout];
        }
    }
    
    [self.input500CoinArea setFrame:(CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN * 2, 30))];
    offsetY += self.input500CoinArea.frame.size.height+1;
    {
        [self.title500CoinLB setFrame:(CGRectMake(0, 0, 256, self.input500CoinArea.frame.size.height))];
        [self.add500CoinBtn setFrame:(CGRectMake(270, 0, 30, 30))];
    }
   
    [self.input100CoinArea setFrame:(CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN * 2, 30))];
    offsetY += self.input100CoinArea.frame.size.height + 10;
    {
        [self.title100CoinLB setFrame:(CGRectMake(0, 0, 256, self.input100CoinArea.frame.size.height))];
        [self.add100CoinBtn setFrame:(CGRectMake(270, 0, 30, 30))];

    }
   
    [self.moneyControllArea setFrame:(CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN * 2, 30))];
    offsetY += self.moneyControllArea.frame.size.height + 10;
    {
        [self.moneyTitleLB setFrame:(CGRectMake(5, 0, 61, 30))];
        [self.remainMoneyShowTF setFrame:(CGRectMake(63, 0, 200, 30))];
        [self.moneyChangeBtn setFrame:(CGRectMake(270, 0, 35, 30))];
    }
    
    [self.displayView setFrame:(CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN * 2, 145))];
    offsetY += self.displayView.frame.size.height;
    {
        
    }
   
}

/***********************
 * Action
 **********************/

- (void) didSelectWCustomButton:(WCustomButton *)customBtn{
    DrinkObject *drinkObj = [self.trayBox.drinkKinds objectAtIndex:customBtn.tag];
    
    if([self.casher buyDrink:drinkObj]){//구매완료
        NSString *successMsg = [NSString stringWithFormat:@"%@ 1개가 나왔습니다.\n",drinkObj.name];
        [self.displayView setText:[self.displayView.text stringByAppendingString:successMsg]];
        [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
    }else{//구매실패
        [self.displayView setText:[self.displayView.text stringByAppendingString:@"잔액이 부족합니다.\n"]];
    }
}

- (void) onTouchupInsideAddCoin:(UIButton *)sender{
    NSInteger tag = sender.tag;
    if(tag == 100){
        [self.casher addCoin100];
    }else if(tag == 500){
        [self.casher addCoin500];
    }else{
        NSLog(@"Error\n");
    }
    
    [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
}

- (void) onTouchupInsideMoneyChangeBtn:(UIButton *)sender{
    
    NSDictionary *coinDic = [self.casher changeMoney];
    NSNumber *coin500Count = coinDic[@"500"];
    NSNumber *coin100Count = coinDic[@"100"];
    
    NSInteger changeMoney = (500*coin500Count.integerValue) + (100*coin100Count.integerValue);
    
    //남은돈 표시
    [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",self.casher.inputMoney]];
    
    
    //로그 표기
    NSString *changeMsg = [NSString stringWithFormat:@"거스름돈은 %ld입니다.(500원 동전 %@개, 100원 동전 %@개)\n",changeMoney,coin500Count, coin100Count];
    
    [self.displayView setText:[self.displayView.text stringByAppendingString:changeMsg]];

}
@end
