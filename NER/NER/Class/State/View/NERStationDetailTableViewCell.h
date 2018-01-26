//
//  NERStationDetailTableViewCell.h
//  NER
//
//  Created by 方琼蔚 on 17/12/6.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NERStationDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *fast;
@property (weak, nonatomic) IBOutlet UILabel *fastEmpty;
@property (weak, nonatomic) IBOutlet UILabel *slow;
@property (weak, nonatomic) IBOutlet UILabel *slowEmpty;

@end
