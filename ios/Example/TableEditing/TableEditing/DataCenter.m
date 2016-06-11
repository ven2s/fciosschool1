//
//  DataCenter.m
//  TableEditing
//
//  Created by David June Kang on 2016. 6. 9..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic, strong) NSMutableArray *firstSectionData;
@property (nonatomic, strong) NSMutableArray *secondSectionData;


@end

@implementation DataCenter

+ (instancetype) defaultData{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter  = [[DataCenter alloc]init];
        dataCenter.firstSectionData = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", nil];
        dataCenter.secondSectionData = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", nil];
    });
    
    
    return dataCenter;
}

-(NSMutableArray *)dataForSection:(NSInteger)section{
    if(section == 0){
        return self.firstSectionData;
    }
    return self.secondSectionData;
}

-(NSInteger)numberOfRowInSection:(NSInteger)section{
    if(section == 0){
        return [self.firstSectionData count];
    }
    return [self.secondSectionData count];
}

-(void) insertNewItemInSecondSection{
    [self.secondSectionData addObject:@"New Data"];
}

-(void) removeFirstSectionItemAtIndex:(NSInteger)index{
    [self.firstSectionData removeObjectAtIndex:index];
}

@end
