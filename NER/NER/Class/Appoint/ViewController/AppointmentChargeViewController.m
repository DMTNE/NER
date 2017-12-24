//
//  AppointmentChargeViewController.m
//  BCP
//
//  Created by Harry on 2017/12/20.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "AppointmentChargeViewController.h"
#import "TableViewCell.h"

@interface AppointmentChargeViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *place1,*place2,*place3,*arr4;
//    UIDatePicker *time;
//    UIDatePicker *place;
//    UIDatePicker *car;
}
//@property(nonatomic,strong) UITableView *PickView;
//@property(nonatomic,strong) TableViewCell *Pick;
@property (weak, nonatomic) IBOutlet UIButton *ConformBtn;
@end

@implementation AppointmentChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预约充电";
    _ConformBtn.layer.masksToBounds = YES;
    _ConformBtn.layer.cornerRadius = 25;
    
    _TimeField.delegate = self;
    _PlaceField.delegate = self;
    _CarField.delegate = self;
    
    _TimeField.tag = 1;
    _PlaceField.tag = 2;
    _CarField.tag = 3;
    place1 = [NSArray arrayWithObjects:@"杭州", nil];
    place2 = [NSArray arrayWithObjects:@"西湖区",@"滨江区",@"上城区", nil];
    place3 = [NSArray arrayWithObjects:@"地点1",@"地点2",@"地点3", nil];
    
//    arr1 = [NSArray arrayWithObjects:@"姓名：",@"手机号：",@"预约时间：",@"预约地点：",@"车型：", nil];
//    arr2 = [NSArray arrayWithObjects:@"my",@"phone",@"time",@"location",@"car", nil];
//    arr3 = [NSArray arrayWithObjects:@"请输入您的姓名",@"请输入您的手机号码",@"请选择您的预约时间",@"请选择您的预约地点",@"请选择您的车型",nil];
//    arr4 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
//    _PickView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 290) style:UITableViewStylePlain];
//    _PickView.scrollEnabled = NO;
//    _PickView.delegate = self;
//    _PickView.dataSource = self;
//
//    [self.view addSubview:_PickView];
//    _Pick.TextField.delegate=self;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ------>> UIPickView 的协议方法  编辑键盘 <<------
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSLog(@"返回列数!");
    return 3;
}

#pragma mark ------>> 每个组件的 row 数量 <<------
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//    // 先找到选中的省份
//    NSInteger indexP = self.provinceCurrentIndex;
//    province_Model *modelP = self.allProvinceArray[indexP];
//    
//    switch (component) {
//        case 0:
//            return self.allProvinceArray.count;
//            break;
//        case 1:
//        {// 根据第 0 列选中省 得到对应的城市数组
//            return modelP.cityArray.count;
//        }
//            break;
//        case 2:
//        {// 根据第 1 列选中城市  找到县级的数组
//            city_Model *modelC = modelP.cityArray[_cityCurrentIndex];
//            return  modelC.countyArray.count;
//        }
//            break;
//            
//        default:
//            return 0;
//            break;
//    }
//    
//    
//}
//#pragma mark ------>> 当我们滑动列选中某一个 row 的时候  要更新视图 让与之相关的列更新 <<------
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//    NSLog(@"滚动了第 %ld 列 ",component);
//    switch (component) {
//        case 0:
//            // 滑动了第 0 列 更新后两列
//            self.provinceCurrentIndex = [pickerView selectedRowInComponent:0];
//            [pickerView reloadComponent:1];
//            [pickerView selectRow:0 inComponent:1 animated:YES];
//            self.cityCurrentIndex = 0;
//            [pickerView reloadComponent:2];
//            [pickerView selectRow:0 inComponent:2 animated:YES];
//            break;
//            
//        case 1:
//            // 滑动了第 1 列 更新最后一列
//            self.cityCurrentIndex = [pickerView selectedRowInComponent:1];
//            [pickerView reloadComponent:2];
//            [pickerView selectRow:0 inComponent:2 animated:YES];
//            self.countyCurrenIndex = 0;
//            break;
//            
//        case 2:
//            self.countyCurrenIndex = [pickerView selectedRowInComponent:2];
//            break;
//            
//        default:
//            break;
//    }
//    
//    
//    // 当前选中的 省份
//    province_Model *modelP = self.allProvinceArray[_provinceCurrentIndex];
//    // 当前的选中的 城市
//    city_Model *modelC = modelP.cityArray[_cityCurrentIndex];
//    // 当前选中 县城
//    NSString *countyStr = [NSString new];
//    if (_countyCurrenIndex >= modelC.countyArray.count)
//    {
//        countyStr = modelC.countyArray[0];
//        [pickerView selectRow:0 inComponent:2 animated:YES];
//    }else
//    {
//        countyStr = modelC.countyArray[_countyCurrenIndex];
//    }
//    // 给 addressFiled 赋值
//    self.addressFiled.text = [NSString stringWithFormat:@"%@  %@  %@",modelP.provinceName, modelC.cityName, countyStr];
//}
//#pragma mark ------>> PickerView 显示的内容 <<------
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    // 获取第 0 列选中的省份  那么后面的城市就是这个省份的城市数组里面的
//    NSInteger indexP = self.provinceCurrentIndex;
//    province_Model *modelP = self.allProvinceArray[indexP];
//    
//    // 创建 UILabel 用于显示每一个 row 上面的内容
//    UILabel *label = [UILabel new];
//    label.adjustsFontSizeToFitWidth = YES;
//    
//    switch (component) {
//        case 0:
//        {// 第 0 列 显示省份
//            label.text =  [self.allProvinceArray[row] provinceName];
//        }
//            break;
//        case 1:
//        {// 根据第 0 选中的省份 来确定第 1 列显示城市
//            label.text =  [modelP.cityArray[row] cityName];
//        }
//            break;
//        case 2:
//        {// 根据第 1 列选中城市  找到县级的数组 返回对应的下标的县名
//            //     NSInteger indexCity = [pickerView selectedRowInComponent:1];
//            
//            label.text =  [modelP.cityArray[_cityCurrentIndex] countyArray][row];
//        }
//            break;
//            
//        default:
//            label.text = @"其他";
//            break;
//    }
//    return label;
//}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return arr1.count;
//}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString * const cellIdentifier = @"Pick";
//    _Pick = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if(!_Pick)
//    {
//        _Pick = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
//    }
//    _Pick.Label.text = arr1[indexPath.row];
//    _Pick.ImageView.image = [UIImage imageNamed:arr2[indexPath.row]];
//    _Pick.TextField.placeholder=arr3[indexPath.row];
////    _Pick.ListBtn.imageView.image = [UIImage imageNamed:@"Triangle"];
//    _Pick.TextField.tag=[indexPath row];
//    _Pick.ListBtn.tag=[indexPath row];
//    if(_Pick.ListBtn.tag == 0 || _Pick.ListBtn.tag == 1)
//    {
//        _Pick.ListBtn.hidden = YES;
//    }else
//    {
//        _Pick.ListBtn.hidden = NO;
//    }
//
//
//    return _Pick;
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 58;
//}
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    //如果当前要显示的键盘，那么把UIDatePicker（如果在视图中）隐藏
//    if (_TimeField.tag != 1) {
//        if (_TimeField.superview) {
//            [_TimeField removeFromSuperview];
//        }
//        return YES;
//    }
//    //UIDatePicker以及在当前视图上就不用再显示了
//    if (_TimeField.superview == nil) {
//        //close all keyboard or data picker visible currently
//        [_PlaceField resignFirstResponder];
//        [_CarField resignFirstResponder];
//        //此处将Y坐标设在最底下，为了一会动画的展示
//        _TimeField.frame = CGRectMake(0, SCREEN_HEIGHT-216, SCREEN_WIDTH, 216);
//        [self.view addSubview:_TimeField];
//
////        [UIView beginAnimations:nil context:nil];
////        [UIView setAnimationDuration:0.3f];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//////        _TimeField.bottom -= _TimeField.height;
////        [UIView commitAnimations];
//    }
//
//    return NO;
//}
- (void)chooseDate:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *dateString = [formatter stringFromDate:selectedDate];
    _TimeField.text = dateString;
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
