//
//  DataCenter.m
//  LoginTest
//
//  Created by David June Kang on 2016. 6. 4..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance{
        static DataCenter *dataCenter = nil;
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dataCenter = [[DataCenter alloc]init];
        });
        return dataCenter;
}

- (NSArray *) loadData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDicrectoy = [paths objectAtIndex:0];
    NSString *path = [documentDicrectoy stringByAppendingPathComponent:@"loginList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]){
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"loginList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:path error:nil];
    }

    return [NSArray arrayWithContentsOfFile:path];
}


- (BOOL) addEmail:(NSString *)email passwd:(NSString *)passWord nickName:(NSString *)nick realName:(NSString *)name gender:(NSString *)sex{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDicrectoy = [paths objectAtIndex:0];
    NSString *path = [documentDicrectoy stringByAppendingPathComponent:@"loginList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]){
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"loginList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:path error:nil];
    }
    
    NSMutableArray *loginList = [NSMutableArray arrayWithContentsOfFile:path];
    NSDictionary *user = @{@"email":email, @"password":passWord, @"nickName":nick, @"realName":name, @"gender":sex};
    
    BOOL haveUser = [self isUser:email passwd:passWord];
    
    if(!haveUser){
        [loginList addObject:user];
        [loginList writeToFile:path atomically:NO];
    }
    
    NSLog(@"%@",haveUser ? @"YES" : @"NO");
    
    return [self isUser:email passwd:passWord];
}

- (BOOL) isUser:(NSString *)userId passwd:(NSString *)pass{
    NSLog(@"call isUser : %@ %ld",userId,[self loadData].count);
    
    NSArray *userList = [self loadData];

    for(NSDictionary *user in userList){
        NSString *email = [user objectForKey:@"email"];
        NSString *pw = [user objectForKey:@"password"];
        NSLog(@"%@, %@",email, pw);
        if([email isEqualToString:userId] && [pw isEqualToString:pass]){
            return YES;
        }
    }
    
    return NO;
}

- (NSString *) showUserInfo:(NSString *)userId{
    NSLog(@"CALL showUserInfo : %@",userId);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDicrectoy = [paths objectAtIndex:0];
    NSString *path = [documentDicrectoy stringByAppendingPathComponent:@"loginList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]){
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"loginList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:path error:nil];
    }
    
    
    NSArray *userList = [NSArray arrayWithContentsOfFile:path];

    for(NSDictionary *userInfo in userList){
        NSString *email = [userInfo objectForKey:@"email"];
        NSString *name  = [userInfo objectForKey:@"realName"];
        NSString *nick  = [userInfo objectForKey:@"nickName"];
        NSString *sex   = [userInfo objectForKey:@"gender"];
        if([email isEqualToString:userId]){
            NSLog(@"%@", email);
            
            NSString *result = [[NSString alloc]initWithFormat:@"---------------------------\n 별명(실명) : %@(%@)\n E-Mail : %@\n 성별 : %@\n---------------------------\n",name,nick,email,sex];
            
            NSLog(@"%@",result);
            return result;
        }
        
    }
    return @"";
}

-(BOOL) autoLogin{
    NSNumber *boolNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"AUTO_LOGIN"];
    return boolNumber.boolValue;
}

-(NSString *) autoLoginToString{
    NSNumber *boolNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"AUTO_LOGIN"];
    if(boolNumber.boolValue){
        return [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"USER_ID"]];
    }
    
    return @"";
}

-(void) setAutoLogin:(BOOL)isAutoLogin{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:isAutoLogin] forKey:@"AUTO_LOGIN"];
//    [[NSUserDefaults standardUserDefaults] setBool:isAutoLogin forKey:@"AUTO_LOGIN"];
}

-(void) setAutoLogin:(BOOL)isAutoLogin email:(NSString *)userId{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:isAutoLogin] forKey:@"AUTO_LOGIN"];
    //    [[NSUserDefaults standardUserDefaults] setBool:isAutoLogin forKey:@"AUTO_LOGIN"];
    [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"USER_ID"];
}

-(NSString *) userName{
    
    
    return nil;
}
-(void) setUserName:(NSString *) userName{
    
}


@end
