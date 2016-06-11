//
//  DataCenter.h
//  TableEditing
//
//  Created by David June Kang on 2016. 6. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

//#import <Foundation/Foundation.h> //맥용 이다
#import <UIKit/UIKit.h> //iOS용이다 (모바일 용이 라서 되는 놈이 있는 거다

@interface DataCenter : NSObject

+ (instancetype) defaultData;

-(NSMutableArray *)dataForSection:(NSInteger)section;
-(NSInteger)numberOfRowInSection:(NSInteger)section;
-(void) insertNewItemInSecondSection;
-(void) removeFirstSectionItemAtIndex:(NSInteger)index;
@end