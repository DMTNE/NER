//
//  NERDetailsViewController.m
//  NER
//
//  Created by Fangjw on 2017/12/19.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERDetailsViewController.h"
#import "NERDetailsTableView.h"
#import "UIView+Masonry.h"
#import "UIButton+Masonry.h"

@interface NERDetailsViewController ()

@property (nonatomic, strong)NERDetailsTableView *tableView;

@property (nonatomic, strong)UIButton *startBtn;

@end

@implementation NERDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"充电桩详情";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createView];
}

-(void)createView{
    _tableView = [[NERDetailsTableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 150, 0));
    }];
    
    UIView *view=[UIView viewbackClolr:[UIColor whiteColor] superView:self.view];
    [view mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@150);
    }];
    self.startBtn=[UIButton buttonWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] backClolr:SECOND_COLOR radius:25 superView:view];
    [self.startBtn setTitle:@"开始充电" forState:UIControlStateNormal];
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(view).offset(30);
        make.right.equalTo(view).offset(-30);
        make.centerY.equalTo(view);
        make.height.equalTo(@50);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
