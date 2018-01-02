//
//  AppointmentChargeViewController.m
//  BCP
//
//  Created by Harry on 2017/12/20.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "AppointmentChargeViewController.h"
#import "TableViewCell.h"

@interface AppointmentChargeViewController ()
{
    NSArray *place1,*place2,*place3,*arr4;
}
@property (weak, nonatomic) IBOutlet UIButton *ConformBtn;
@end

@implementation AppointmentChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预约充电";
    _ConformBtn.layer.masksToBounds = YES;
    _ConformBtn.layer.cornerRadius = 25;
    
    _TimeField.tag = 1;
    _PlaceField.tag = 2;
    _CarField.tag = 3;
    place1 = [NSArray arrayWithObjects:@"杭州", nil];
    place2 = [NSArray arrayWithObjects:@"西湖区",@"滨江区",@"上城区", nil];
    place3 = [NSArray arrayWithObjects:@"地点1",@"地点2",@"地点3", nil];

    self.time = [UIDatePicker new];
    
    _time.datePickerMode = UIDatePickerModeTime;
    _time.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    self.time.minuteInterval = 1;
    self.TimeField.inputView = _time; // 用 UIDatePicker 替换 timeField 的键盘
    [self.time addTarget:self action:@selector(chooseDate:) forControlEvents:UIControlEventValueChanged];
    
    self.place = [[UIPickerView alloc] init];
    self.place.delegate = self;
    self.place.dataSource = self;
    self.PlaceField.inputView = _place;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_NameField resignFirstResponder];
    [_PhoneField resignFirstResponder];
    [_TimeField resignFirstResponder];
    [_PlaceField resignFirstResponder];
    [_CarField resignFirstResponder];
}

- (IBAction)reservation:(id)sender {
     if(self.NameField.text.length == 0
        || self.PhoneField.text.length ==0
        || self.TimeField.text.length ==0
        || self.PlaceField.text.length ==0
        || self.CarField.text.length ==0) {
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请先填写完整信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             NSLog(@"确定");
         }];
         [alert addAction:sure];
         [self presentViewController:alert animated:YES completion:nil];
     }
}

#pragma mark ------>> UIPickView 的协议方法  编辑键盘 <<------
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSLog(@"返回列数!");
    return 3;
}

#pragma mark ------>> 每个组件的 row 数量 <<------
- (void)chooseDate:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *dateString = [formatter stringFromDate:selectedDate];
    _TimeField.text = dateString;
}

@end
