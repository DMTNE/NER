//
//  NERChargingStatusTableViewCell.h
//  NER
//
//  Created by 方琼蔚 on 17/12/11.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NERChargingStatusTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *arrive;

@end
