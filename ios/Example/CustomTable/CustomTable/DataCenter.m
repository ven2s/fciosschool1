//
//  DataCenter.m
//  CustomTable
//
//  Created by David June Kang on 2016. 6. 8..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "DataCenter.h"

//설정값을 저장위한 키값
static NSString *const keySoundSetting = @"UserSoundIsOn";
static NSString *const keyVibrateSettting = @"UserVirateIsOn";

@interface DataCenter()

@property (nonatomic, strong) NSArray *settingTableData;
@property (nonatomic, strong) NSArray *settingHeaderTitle;


@end

@implementation DataCenter

//SingleTon객체 생성
+ (instancetype)defaultData
{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.settingTableData = @[@[@"사운드", @"진동"], @[@"세계날씨", @"한국날씨"]];
        dataCenter.settingHeaderTitle = @[@"설정", @"날씨"];
    });
    
    return dataCenter;
}

-(NSInteger) numberOfSectionForSetiingTable{
    return [self.settingTableData count];
}

-(NSArray *)settingTableDataForSection:(NSInteger) section{
    return (NSArray *)self.settingTableData[section];
}

-(NSInteger) numberOfRowsForSectionInSettingTable:(NSInteger) section{
    return [[self settingTableDataForSection:section]count];
}

-(NSString *)settingTableHeaderForSection:(NSInteger) section{
    return (NSString *)self.settingHeaderTitle[section];
}


//셋팅값을 저장한다.
-(void) setSetting:(SettingRow) function isOn:(BOOL) isOn{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    NSString *key = nil;
    
    if(function == SettingRowSound){
        key = keySoundSetting;
    }else{
        key = keyVibrateSettting;
    }
    
    
    [userDefault setBool:isOn forKey:key];
    [userDefault synchronize];
}

//셋팅값을 보여준다.
-(BOOL) isOnForSetting:(SettingRow) function{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    
    if(function == SettingRowSound){
        key = keySoundSetting;
    }else{
        key = keyVibrateSettting;
    }
  
    return [userDefault boolForKey:key];
}

//날씨 정보를 리턴
-(NSArray *)dataForWeather:(WeatherType) type{
    if(type == WeatherTypeKorea) {
        return @[@"더워", @"30도", @"습헤", @"찝찝해"];
    }else{
        return @[@"그냥더워", @"???", @"몰라", @"몰라잉"];
    }
}

@end
