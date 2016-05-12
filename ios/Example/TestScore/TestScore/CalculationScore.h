//
//  CalculationScore.h
//  TestScore
//
//  Created by David June Kang on 2016. 5. 10..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationScore : NSObject
- (void) addSubjectScore:(NSInteger)score;
- (CGFloat) averageScore;
- (void) showAllScore;
- (void) showAllPoint;
- (CGFloat) roundLast:(CGFloat)num;
@end
