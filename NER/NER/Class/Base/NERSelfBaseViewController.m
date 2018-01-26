//
//  NERSelfBaseViewController.m
//  NER
//
//  Created by Fangjw on 2018/1/2.
//  Copyright © 2018年 New Energy. All rights reserved.
//

#import "NERSelfBaseViewController.h"

@interface NERSelfBaseViewController ()

@end

@implementation NERSelfBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)navigationViewDidLoad{
    self.backButtonItemImage = [UIImage imageNamed:@"back"];
    [self showImageColorNavigationBarBackground:[UIColor whiteColor] textTintColor:THEME_COLOR textFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] isTranslucent:NO];
}

@end
