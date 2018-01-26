//
//  EndAppointVIewController.h
//  NER
//
//  Created by Harry on 2017/12/26.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndAppointVIewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *locationLable;
@property (weak, nonatomic) IBOutlet UILabel *carLable;

@property (strong,nonatomic) NSString * getNameText;
@property (strong,nonatomic) NSString * getPhoneText;
@property (strong,nonatomic) NSString * getTimeText;
@property (strong,nonatomic) NSString * getCarText;
@property (strong,nonatomic) NSString * getagainLocation;

@end
