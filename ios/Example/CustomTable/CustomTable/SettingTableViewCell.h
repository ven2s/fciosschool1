//
//  SettingTableViewCell.h
//  CustomTable
//
//  Created by David June Kang on 2016. 6. 8..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <UIKit/UIKit.h>


//////////////////////////////////////////
// Delegate선언을 위한것들
//  * @class [name] 은 참조를 해준다
//  * @protocol ~ @end는 Delegate 를 만들어 준다.
//  * 프로퍼티에서 델리게이트를 사용하기 위해 선언을 해준다.
//////////////////////////////////////////
@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>

@required
-(void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end



//////
@interface SettingTableViewCell : UITableViewCell

//@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UISwitch *settingSwitch;

//Delegate의 설정
@property (nonatomic, weak) id<SettingTableViewCellDelegate> delegate;

@end
