//
//  SettingTableViewCell.m
//  CustomTable
//
//  Created by David June Kang on 2016. 6. 8..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//그릴때
- (void) drawRect:(CGRect)rect{
    [super drawRect:rect];
}


//액서세리에 있는 스위치
-(void) switchValueChanged:(UISwitch *)sender{
    NSLog(@"Switch is %d",sender.isOn);
    //Delegate 호출
    [self.delegate settingTableViewCellSwitchValueChanged:self isOn:sender.isOn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//TableCell 초기화
//drawrect는 그릴때이기 때문에 초기화를 해줘야 한다.
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.settingSwitch = [[UISwitch alloc]init];
    self.accessoryView = self.settingSwitch;
    
    //이벤트처리
    [self.settingSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return self;
}

@end
