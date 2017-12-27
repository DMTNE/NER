//
//  NERParkingStateViewController.m
//  NER
//
//  Created by Fangjw on 2017/12/27.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERParkingStateViewController.h"
#import "NERParkingStateTableView.h"

@interface NERParkingStateViewController ()

@property (nonatomic, strong)NERParkingStateTableView *tableView;

@end

@implementation NERParkingStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"停车状态";
    [self createView];
}

-(void)createView{
    _tableView = [[NERParkingStateTableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

@end
