//
//  DataCenter.h
//  CustomTable
//
//  Created by David June Kang on 2016. 6. 8..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherTableViewController.h"

//설정값을위한 설정항목 선언
typedef NS_ENUM(NSInteger, SettingRow){
    SettingRowSound = 0,
    SettingRowVibate
};


@interface DataCenter : NSObject

//싱글톤 생성자
+ (instancetype)defaultData;

//섹션항목 갯수
-(NSInteger) numberOfSectionForSetiingTable;

//섹션 항목 데이터
-(NSArray *)settingTableDataForSection:(NSInteger) section;

//로우 항목 데이터 갯수
-(NSInteger) numberOfRowsForSectionInSettingTable:(NSInteger) section;

//헤더에 넣을 섹션 데이터
-(NSString *)settingTableHeaderForSection:(NSInteger) section;

////////////////////////////////////////
//  설정값 저장을 위한 함수 선언
////////////////////////////////////////

//설정값 셋팅
-(void) setSetting:(SettingRow) function isOn:(BOOL) isOn;

//설정값 불러오기
-(BOOL) isOnForSetting:(SettingRow) function;

//날씨정보 데이터
-(NSArray *)dataForWeather:(WeatherType) type;

@end
