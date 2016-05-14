//
//  WCustomButton.h
//  VendingMachine
//
//  Created by David June Kang on 2016. 5. 13..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WCustomButtonDelegate;
@interface WCustomButton : UIView

@property (nonatomic, weak, nullable) id <WCustomButtonDelegate> delegate;

- (void)setTitle:(nullable NSString *)title;
- (void)setImageWithName:(nullable NSString *)imageName;
- (void)setCost:(nullable NSString *)cost;
- (void) updateLayout;
@end

@protocol WCustomButtonDelegate <NSObject>

- (void) didSelectWCustomButton:(nullable WCustomButton *) customBtn;

@end