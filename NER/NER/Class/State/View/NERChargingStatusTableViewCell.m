//
//  NERChargingStatusTableViewCell.m
//  NER
//
//  Created by 方琼蔚 on 17/12/11.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERChargingStatusTableViewCell.h"


@interface NERChargingStatusTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *whiteBg;

@end

@implementation NERChargingStatusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.whiteBg.layer.cornerRadius = 15;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
