//
//  AppointmentChargeViewController.h
//  BCP
//
//  Created by Harry on 2017/12/20.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentChargeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *PhoneField;
@property (weak, nonatomic) IBOutlet UITextField *TimeBField;
@property (weak, nonatomic) IBOutlet UITextField *TimeEField;
@property (weak, nonatomic) IBOutlet UITextField *CarField;
@property (weak, nonatomic) IBOutlet UILabel *getLocation;

@property (nonatomic,strong) UIDatePicker *timeB;
@property (nonatomic,strong) UIDatePicker *timeE;
@property (nonatomic,strong) UIPickerView *car;
@property (strong,nonatomic) NSArray * Arrcar;
@property (strong,nonatomic) NSString *getLocationText;



@end
