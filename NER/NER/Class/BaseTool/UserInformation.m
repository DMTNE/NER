//
//  UserInformation.m
//  NER
//
//  Created by Fangjw on 2018/1/2.
//  Copyright © 2018年 New Energy. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

static  UserInformation *sharedInstance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[UserInformation alloc] init];
        [sharedInstance setStatus];
    });
    return sharedInstance;
}

-(void)setStatus{
    _ifPop=YES;
}

-(BOOL)cleanUp
{
    _oauthToken = @"";
    _refreshToken = @"";
    _userId = @"";
    _expiresIn = @"";
    _userName = @"";
    _userSign = @"";
    _avatarPath = @"";
    return YES;
}

-(BOOL)isLogon
{
    return _userId.length > 0;
}

@end
