//
//  AppointmentCell.m
//  BCP
//
//  Created by Harry on 2017/11/22.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "AppointmentCell.h"

@implementation AppointmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
