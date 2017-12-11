//
//  AppointViewController.m
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "AppointViewController.h"

@interface AppointViewController ()

@end

@implementation AppointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"周边站点";
}

@end
