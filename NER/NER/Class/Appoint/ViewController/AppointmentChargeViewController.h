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
@property (weak, nonatomic) IBOutlet UITextField *TimeField;
@property (weak, nonatomic) IBOutlet UITextField *PlaceField;
@property (weak, nonatomic) IBOutlet UITextField *CarField;
@property (nonatomic,strong) UIDatePicker *time;
@property (nonatomic,strong) UIPickerView *place;
@property (nonatomic,strong) UIPickerView *car;
@end
