//
//  AppointmentChargeViewController.m
//  BCP
//
//  Created by Harry on 2017/12/20.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "AppointmentChargeViewController.h"
#import "EndAppointVIewController.h"

@interface AppointmentChargeViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *ConformBtn;


@end

@implementation AppointmentChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预约充电";
    _ConformBtn.layer.masksToBounds = YES;
    _ConformBtn.layer.cornerRadius = 24;
    _TimeBField.delegate = self;
    _TimeEField.delegate = self;
    _CarField.delegate = self;
    
    _getLocation.text=_getLocationText;
    _getLocation.lineBreakMode = NSLineBreakByWordWrapping;
    _getLocation.numberOfLines = 0;

    
    _Arrcar = [[NSMutableArray alloc]  initWithObjects:@"奥迪",@"宝马",@"保时捷",@"奔驰",@"比亚迪",@"长安",@"大众",@"凯迪拉克",@"奇瑞",@"雪佛兰",@"现代", nil];
    
    self.timeB = [UIDatePicker new];
    _timeB.datePickerMode = UIDatePickerModeTime;
    _timeB.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    self.timeB.minuteInterval = 5;
    self.TimeBField.inputView = _timeB; // 用 UIDatePicker 替换 timeField 的键盘
    [self.timeB addTarget:self action:@selector(chooseBDate:) forControlEvents:UIControlEventValueChanged];
    
    self.timeE = [UIDatePicker new];
    _timeE.datePickerMode = UIDatePickerModeTime;
    _timeE.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    self.timeE.minuteInterval = 5;
    self.TimeEField.inputView = _timeE;
    [self.timeE addTarget:self action:@selector(chooseEDate:) forControlEvents:UIControlEventValueChanged];
    
    self.car = [[UIPickerView alloc] init];
    self.car.tag=2;
    self.car.delegate = self;
    self.car.dataSource = self;
    self.CarField.inputView = _car;
    
    [_ConformBtn addTarget:self action:@selector(EndAppointment) forControlEvents:UIControlEventTouchUpInside];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_NameField resignFirstResponder];
    [_PhoneField resignFirstResponder];
    [_TimeBField resignFirstResponder];
    [_TimeEField resignFirstResponder];
    [_CarField resignFirstResponder];
}

-(void)warning:(NSString*)msg{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"好" otherButtonTitles: nil];
    [alert show];
    return;
}

-(void)EndAppointment
{
    if (_NameField.text.length==0){
        [self warning:@"姓名不能为空！"];
        return;
    }
    if (_PhoneField.text.length==0){
        [self warning:@"手机号不能为空！"];
        return;
    }else if(_PhoneField.text.length!=11)
    {
        [self warning:@"手机号应该是11位！"];
        return;
    }
    if (_TimeBField.text.length==0){
        [self warning:@"预约时间不能为空！"];
        return;
    }
    if (_CarField.text.length==0){
        [self warning:@"车型不能为空！"];
        return;
    }
    
    EndAppointVIewController *end = [[EndAppointVIewController alloc] init];
    
    end.getCarText = self.CarField.text;
    end.getNameText = self.NameField.text;
    end.getTimeText = self.TimeBField.text;
    end.getPhoneText = self.PhoneField.text;
    end.getagainLocation = self.getLocation.text;
    
    [self.navigationController pushViewController:end animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//#pragma mark ------>> UIPickView 的协议方法  编辑键盘 <<------
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _Arrcar.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * title = nil;
    title = _Arrcar[row];
    return title;

}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.CarField.text = self.Arrcar[row];
}

- (void)chooseBDate:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *dateString = [formatter stringFromDate:selectedDate];
    _TimeBField.text = dateString;
}

- (void)chooseEDate:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *dateString = [formatter stringFromDate:selectedDate];
    _TimeEField.text = dateString;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
