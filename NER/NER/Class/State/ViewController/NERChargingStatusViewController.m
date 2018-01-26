//
//  NERChargingStatusViewController.m
//  NER
//
//  Created by 方琼蔚 on 17/12/6.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERChargingStatusViewController.h"
#import "NERChargingStationTableViewCell.h"
#import "NERStationDetailTableViewCell.h"
#import "NERChargingStatusTableViewCell.h"
#import "NERChargingOperateTableViewCell.h"


static NSString * const kChargingStationTableViewCell = @"NERChargingStationTableViewCell";
static NSString * const kStationDetailTableViewCell = @"NERStationDetailTableViewCell";
static NSString * const kChargingStatusTableViewCell = @"NERChargingStatusTableViewCell";
static NSString * const kChargingOperateTableViewCell = @"NERChargingOperateTableViewCell";

@interface NERChargingStatusViewController ()

@property(nonatomic, strong) NSDictionary *chargingStation;
@property(nonatomic, strong) NSDictionary *statusInfo;

@end

@implementation NERChargingStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title=@"停车状态";
    
    self.tableView.backgroundColor = BG_COLOR;
    self.tableView.separatorStyle = NO;
    [self.tableView registerNib:[UINib nibWithNibName:kChargingStationTableViewCell bundle:nil] forCellReuseIdentifier:kChargingStationTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kStationDetailTableViewCell bundle:nil] forCellReuseIdentifier:kStationDetailTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kChargingStatusTableViewCell bundle:nil] forCellReuseIdentifier:kChargingStatusTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kChargingOperateTableViewCell bundle:nil] forCellReuseIdentifier:kChargingOperateTableViewCell];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"chargingStatus" ofType:@"json"];
    NSLog(@"%@",filePath);
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSDictionary *dic = [json objectForKey:@"data"];//获取指定key值的value，是一个数组
    self.chargingStation = dic[@"chargingStation"];
    self.statusInfo = dic[@"statusInfo"];
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
            cell.sationInfoLabel.text = self.chargingStation[@"name"];
            cell.starView.currentScore = [self.chargingStation[@"score"] integerValue];
            cell.scoreLabel.text = [NSString stringWithFormat:@"%.1f",[self.chargingStation[@"score"] floatValue]];
            return cell;
        }
        else {
            NERStationDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kStationDetailTableViewCell forIndexPath:indexPath];
            cell.location.text = [NSString stringWithFormat:@"%@(%@)",self.chargingStation[@"address"],self.chargingStation[@"distance"]];
            cell.fast.text = [NSString stringWithFormat:@"快充：%@",self.chargingStation[@"fast"]];
            cell.fastEmpty.text = [NSString stringWithFormat:@"空闲：%@",self.chargingStation[@"fastLast"]];
            cell.slow.text = [NSString stringWithFormat:@"慢充：%@",self.chargingStation[@"slow"]];
            cell.slowEmpty.text = [NSString stringWithFormat:@"空闲：%@",self.chargingStation[@"slowLast"]];
            return cell;
        }
    }
    else if (indexPath.section == 1) {
        NERChargingStatusTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kChargingStatusTableViewCell forIndexPath:indexPath];
        cell.status.text = self.statusInfo[@"status"];
        cell.time.text = self.statusInfo[@"predictTime"];
        cell.arrive.text = self.statusInfo[@"desc"];
        return cell;
    }
    else {
        NERChargingOperateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kChargingOperateTableViewCell forIndexPath:indexPath];
        return cell;
    }
}

@end
