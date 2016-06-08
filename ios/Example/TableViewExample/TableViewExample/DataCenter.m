//
//  DataCenter.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic,strong) NSDictionary *animals;
@property (nonatomic,strong) NSArray *animalSectionTitles;
@property (nonatomic,strong) NSArray *animalIndexTitles;

@end

@implementation DataCenter

+ (instancetype)defaultData
{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        
    });
    
    return dataCenter;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setAnimalData];
    }
    return self;
}

- (void)setAnimalData
{
    self.animals = @{
                     @"B" : @[@"Bear", @"Black Swan", @"Buffalo"],
                     @"C" : @[@"Camel", @"Cockatoo"],
                     @"D" : @[@"Dog", @"Donkey"],
                     @"E" : @[@"Emu"],
                     @"G" : @[@"Giraffe", @"Greater Rhea"],
                     @"H" : @[@"Hippopotamus", @"Horse"],
                     @"K" : @[@"Koala"],
                     @"L" : @[@"Lion", @"Llama"],
                     @"M" : @[@"Manatus", @"Meerkat"],
                     @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
                     @"R" : @[@"Rhinoceros"],
                     @"S" : @[@"Seagull"],
                     @"T" : @[@"Tasmania Devil"],
                     @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]
                    };
}

- (NSDictionary *)allAnimals
{
    return self.animals;
}

//localizedCaseInsensitiveCompare 추가하여 내림차순정렬 추가
- (NSArray *)sectionTitles
{
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    return [self.animals.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//    return self.animals.allKeys;
}

- (NSInteger)sectionCount
{
    return self.animals.count;
}

- (NSString *)imageNameWithAnimal:(NSString *)animal
{
    NSString *imageFilename = [[animal lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    imageFilename = [imageFilename stringByAppendingString:@".jpg"];
    
    return imageFilename;
}


- (NSInteger)numberOfRowsForKey:(NSString *)key{
    return [[self valueForKey:key] count];
}

- (NSArray *)valuesForKey:(NSString *)key{
    return self.animals[key];
}
@end
