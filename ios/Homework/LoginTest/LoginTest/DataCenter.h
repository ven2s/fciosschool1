//
//  DataCenter.h
//  LoginTest
//
//  Created by David June Kang on 2016. 6. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;
- (BOOL) addEmail:(NSString *)email passwd:(NSString *)passWord nickName:(NSString *)nick realName:(NSString *)name gender:(NSString *)sex;
- (BOOL) isUser:(NSString *)userId passwd:(NSString *)pass;
- (NSString *) showUserInfo:(NSString *)userId;

-(BOOL) autoLogin;
-(NSString *) autoLoginToString;
-(void) setAutoLogin:(BOOL)isAutoLogin;
-(void) setAutoLogin:(BOOL)isAutoLogin email:(NSString *)userId;

-(NSString *) userName;
-(void) setUserName:(NSString *) userName;

@end
