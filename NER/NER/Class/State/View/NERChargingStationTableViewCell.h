//
//  NERChargingStationTableViewCell.h
//  NER
//
//  Created by 方琼蔚 on 17/12/6.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommitStar.h"

@interface NERChargingStationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sationInfoLabel;
@property (nonatomic, strong) CommitStar *starView;
@property (nonatomic, strong) UILabel *scoreLabel;

@end
