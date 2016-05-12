//
//  ViewController.h
//  calc
//
//  Created by David June Kang on 2016. 5. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //총 계산의 결과값변수
    NSInteger resultNum;
    
    //연산기호를 넣어둘 버퍼
    NSString  *operatorBuffer;
    
    //화면에 표시될 내용
    NSString  *displyText;
    
}


@property (nonatomic, weak) IBOutlet UITextField *displyTextField;

@end