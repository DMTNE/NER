//
//  AppointmentCell.h
//  BCP
//
//  Created by Harry on 2017/11/22.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *stationName;
@property (weak, nonatomic) IBOutlet UILabel *stationLocation;

@end
