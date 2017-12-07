//
//  NERHomeViewController.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERHomeViewController.h"
#import "NERTopNavigationView.h"
#import "NERChoiceView.h"

@interface NERHomeViewController ()

@property (nonatomic, strong) NERTopNavigationView *topNavigationView;

@property (nonatomic, strong) NERChoiceView *choiceView;



@end

@implementation NERHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    [self createTopView];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTopView{
    _topNavigationView=[[NERTopNavigationView alloc]init];
    [self.view addSubview:_topNavigationView];
    [_topNavigationView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view).offset(20);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
        }
    ];
    
    _choiceView=[[NERChoiceView alloc]init];
    [self.view addSubview:_choiceView];
    [_choiceView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.equalTo(@175);
    }
     ];
}

@end
