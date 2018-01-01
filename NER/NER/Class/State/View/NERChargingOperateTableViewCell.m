//
//  NERChargingOperateTableViewCell.m
//  NER
//
//  Created by 方琼蔚 on 17/12/30.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERChargingOperateTableViewCell.h"

@implementation NERChargingOperateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.riseBtn.layer.borderColor = SECOND_COLOR.CGColor;
    self.riseBtn.layer.borderWidth = 1;
    self.riseBtn.layer.cornerRadius = 8;
    
    self.fallBtn.layer.borderColor = SECOND_COLOR.CGColor;
    self.fallBtn.layer.borderWidth = 1;
    self.fallBtn.layer.cornerRadius = 8;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
