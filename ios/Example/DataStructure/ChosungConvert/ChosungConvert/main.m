//
//  main.m
//  ChosungConvert
//
//  Created by David June Kang on 2016. 5. 23..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

//ㄱ ㄴ ㄷ(3)
//ㅏ ㅑ(2)
//없음 ㅇ ㅅ(3)

// 가 강 갓 갸 걍 걋  나 낭 낫 냐 냥 냣 다 당 닷 댜 댱 댯 (18개)
// --------------  ------------- --------------
//       가 (6개)        나 (6개)       다 (6개)
// ------- ------
//    ㅏ      ㅑ
// (2*3)*cho + 3*jung + jong = 번째
// (2, 0, 1) = 2*3*2 + 3*0 + 1 = 13

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *name = @"이런 쪠엔장 ~ 아직도 이러고 있다니 내가 이러고 있다니!!!덜덜";
        NSMutableString *result = [NSMutableString string];
        NSLog(@"%@",name);
        
        // 초성 ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ (19개)
        // 중성 21개
        // 종성 28개
        // 19 * 21 * 28
        // 0xAC00 + 21*28*cho + 28*jung + jong = 최
        NSArray *chosungs = @[@"ㄱ", @"ㄲ", @"ㄴ", @"ㄷ", @"ㄸ", @"ㄹ", @"ㅁ", @"ㅂ", @"ㅃ", @"ㅅ", @"ㅆ", @"ㅇ", @"ㅈ", @"ㅉ", @"ㅊ", @"ㅋ", @"ㅌ", @"ㅍ", @"ㅎ"];
        
        for(NSUInteger i=0; i<[name length]; i++){
            unichar c = [name characterAtIndex:i];
            if(0xAC00 <= c && c <= 0xD7AF){
                NSLog(@"%tu %C %zd",i, c,(NSInteger) c);
                NSInteger x = (NSInteger) c - 0xAC00;
                NSLog(@"%zd 번째", x);
                
                // 21*28*cho + 28*jung + jong = x
                // 28*(21*cho + jung) + jong = x
                NSInteger jong = x % 28;
                //28(21*cho + jung) = x
                x = x - jong;
                // 21*cho + jung = x
                x = x / 28;
                NSInteger jung = x % 21;
                x -= jung;
                //21*cho = x
                NSInteger cho = x / 21;
                NSString *chosung = chosungs[cho];
                NSLog(@"%C %zd 번째 초성 %@", c, cho, chosung);
                
                [result appendString:chosung];
            }else{
                NSString *letter = [name substringWithRange:NSMakeRange(i, 1)];
                NSUInteger index = [chosungs indexOfObject:letter];
                NSLog(@"예외: %@ - %tu", letter, index);
                if(index != NSNotFound){
                    [result appendString:letter];
                }
            }
        }
        NSString *converted = result;
//        converted = [converted stringByReplacingOccurrencesOfString:@"ㄱㄱ" withString:@"ㄲ"];
//        converted = [converted stringByReplacingOccurrencesOfString:@"ㄷㄷ" withString:@"ㄸ"];
//        converted = [converted stringByReplacingOccurrencesOfString:@"ㅂㅂ" withString:@"
//        converted = [converted stringByReplacingOccurrencesOfString:@"ㅅㅅ" withString:@"ㅆ"];
//        converted = [converted stringByReplacingOccurrencesOfString:@"ㅈㅈ" withString:@"ㅉ"];
        
        for (NSString *chosung in @[@"ㄱ",@"ㄷ",@"ㅂ",@"ㅅ",@"ㅈ"]) {
            NSString *str1 = [NSString stringWithFormat:@"%@%@",chosung,chosung];
            NSUInteger index = [chosungs indexOfObject:chosung];
            NSString *str2 = chosungs[index+1];
            converted = [converted stringByReplacingOccurrencesOfString:str1 withString:str2];
        }
        
        NSLog(@"%@", result);
        NSLog(@"%@", converted);
        
    }
    return 0;
}
