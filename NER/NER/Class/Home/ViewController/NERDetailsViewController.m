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
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
