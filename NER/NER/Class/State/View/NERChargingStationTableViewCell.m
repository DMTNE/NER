//
//  NERChargingStationTableViewCell.m
//  NER
//
//  Created by 方琼蔚 on 17/12/6.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERChargingStationTableViewCell.h"
#import "Masonry.h"

@interface NERChargingStationTableViewCell()
@end

@implementation NERChargingStationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.starView = [[CommitStar alloc] initWithFrame:CGRectMake(10, 42, 100, 14)];
    [self.contentView addSubview: self.starView];
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(116, 42, 29, 14)];
    self.scoreLabel.backgroundColor = Rgb2UIColor(254, 149, 38, 1);
    self.scoreLabel.layer.cornerRadius = 7;
    self.scoreLabel.layer.masksToBounds = YES;
    self.scoreLabel.textColor = [UIColor whiteColor];
    self.scoreLabel.font = [UIFont systemFontOfSize:11];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview: self.scoreLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
