//
//  StateViewController.m
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "StateViewController.h"

@interface StateViewController ()

@end

@implementation StateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.topItem.title=@"停车状态";
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
