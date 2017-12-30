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

static NSString * const kChargingStationTableViewCell = @"NERChargingStationTableViewCell";
static NSString * const kStationDetailTableViewCell = @"NERStationDetailTableViewCell";
static NSString * const kChargingStatusTableViewCell = @"NERChargingStatusTableViewCell";

@interface NERParkingStateViewController ()

@end

@implementation NERParkingStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title=@"停车状态";
    
    [self.tableView registerNib:[UINib nibWithNibName:kChargingStationTableViewCell bundle:nil] forCellReuseIdentifier:kChargingStationTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kStationDetailTableViewCell bundle:nil] forCellReuseIdentifier:kStationDetailTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:kChargingStatusTableViewCell bundle:nil] forCellReuseIdentifier:kChargingStatusTableViewCell];
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
    else if (section == 1) {
        return 1;
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
        NERChargingStationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kChargingStationTableViewCell forIndexPath:indexPath];
        return cell;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
