//
//  UserInformation.h
//  NER
//
//  Created by Fangjw on 2018/1/2.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

/********************************登录信息********************/

/**
*  用户id
*/
@property(nonatomic, copy)NSString *userId;
/**
 *  用户名
 */
@property(nonatomic, copy)NSString *userName;
/**
 *  用户个性签名
 */
@property(nonatomic, copy)NSString *userSign;
/**
 *  登录认证信息
 */
@property(nonatomic, copy)NSString *oauthToken;
/**
 *  刷新token
 */
@property(nonatomic, copy)NSString *refreshToken;
/**
 *  生命周期
 */
@property(nonatomic, copy)NSString *expiresIn;
/**
 *  头像地址
 */
@property (nonatomic, copy) NSString *avatarPath;

/********************************登录信息********************/

/**
 *  是否登录
 */
@property(nonatomic, readonly)BOOL isLogon;

+ (instancetype)sharedInstance;

/**
 退出登录
 @return 成功YES 失败NO
 */
-(BOOL)cleanUp;

/**
 *  登录
 */
//-(BOOL)save;

/********************************页面跳转方式********************/

@property(nonatomic, assign)BOOL ifPop;

@end
