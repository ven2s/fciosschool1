//
//  WeatherTableViewController.h
//  CustomTable
//
//  Created by David June Kang on 2016. 6. 8..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WeatherType){
    WeatherTypeKorea = 0,
    WaatherTypeWorld
};

@interface WeatherTableViewController : UITableViewController

@property (nonatomic) WeatherType wetherType;

@end
