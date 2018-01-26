//
//  EndAppointVIewController.m
//  NER
//
//  Created by Harry on 2017/12/26.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "EndAppointVIewController.h"
#import "AppointmentChargeViewController.h"
#import "AppointmentViewController.h"

@interface EndAppointVIewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation EndAppointVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预约成功";
    _carLable.text = self.getCarText;
    _phoneLable.text = self.getPhoneText;
    _nameLable.text = self.getNameText;
    _timeLable.text = self.getTimeText;
    _locationLable.text = self.getagainLocation;
    
    _btn.layer.masksToBounds = YES;
    _btn.layer.cornerRadius = 25;
    _myView.layer.masksToBounds = YES;
    _myView.layer.cornerRadius = 5;
    
    [_btn addTarget:self action:@selector(popTo) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) popTo
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
