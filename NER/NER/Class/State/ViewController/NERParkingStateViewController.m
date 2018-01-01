//
//  NERParkingStateViewController.m
//  NER
//
//  Created by 方琼蔚 on 17/12/6.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERParkingStateViewController.h"
#import "NERChargingStationTableViewCell.h"
#import "NERStationDetailTableViewCell.h"
#import "NERChargingStatusTableViewCell.h"
#import "NERChargingOperateTableViewCell.h"

static NSString * const kChargingStationTableViewCell = @"NERChargingStationTableViewCell";
static NSString * const kStationDetailTableViewCell = @"NERStationDetailTableViewCell";
static NSString * const kChargingStatusTableViewCell = @"NERChargingStatusTableViewCell";
static NSString * const kChargingOperateTableViewCell = @"NERChargingOperateTableViewCell";

@interface NERParkingStateViewController ()

@end

@implementation NERParkingStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title=@"停车状态";
    
    self.tableView.backgroundColor = BG_COLOR;
    [self.tableView registerNib:[UINib nibWithNibName:kChargingStationTableViewCell bundle:nil] forCellReuseIdentifier:kChargingStationTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kStationDetailTableViewCell bundle:nil] forCellReuseIdentifier:kStationDetailTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kChargingStatusTableViewCell bundle:nil] forCellReuseIdentifier:kChargingStatusTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kChargingOperateTableViewCell bundle:nil] forCellReuseIdentifier:kChargingOperateTableViewCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"停车状态";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 66.f;
        }
        else {
            return 100.f;
        }
    }
    else if (indexPath.section == 1) {
        return 186;
    }
    else {
        return 170;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NERChargingStationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kChargingStationTableViewCell forIndexPath:indexPath];
            return cell;
        }
        else {
            NERStationDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kStationDetailTableViewCell forIndexPath:indexPath];
            return cell;
        }
    }
    else if (indexPath.section == 1) {
        NERChargingStatusTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kChargingStatusTableViewCell forIndexPath:indexPath];
        return cell;
    }
    else {
        NERChargingOperateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kChargingOperateTableViewCell forIndexPath:indexPath];
        return cell;
    }
}

@end
