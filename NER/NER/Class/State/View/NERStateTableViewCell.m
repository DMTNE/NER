//
//  NERStateTableViewCell.m
//  NER
//
//  Created by Fangjw on 2017/12/27.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERStateTableViewCell.h"
#import "UILabel+Masonry.h"
#import "UIView+Masonry.h"
#import "UIImageView+Masonry.h"

@interface NERStateTableViewCell()

@property (nonatomic, strong) UIView *stateView;

@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) UILabel *centerLabel;

@property (nonatomic, strong) UILabel *bottomLabel;

@end

@implementation NERStateTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = SECOND_COLOR;
        [self createView];
    }
    return self;
}

-(void)createView{
  /*** 头部 ***/
    self.stateView=[UIView viewbackClolr:[UIColor whiteColor] superView:self.contentView];
    [self.stateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(13);
        make.left.equalTo(self.contentView).offset(10);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    self.stateView.layer.cornerRadius=15;
    
    UIImageView *stateImg=[UIImageView imgWithBackClolr:[UIColor whiteColor] image:[UIImage imageNamed:@"state"] superView:self.stateView];
    [stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stateView).offset(2);
        make.height.width.equalTo(@26);
        make.centerY.equalTo(self.stateView);
    }];
    
    self.stateLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:SECOND_COLOR superView:self.stateView];
    self.stateLabel.text=@"当前状态：正在停车";
    CGSize size =[self.stateLabel.text sizeWithAttributes:@{NSFontAttributeName: self.stateLabel.font}];
    CGFloat width = size.width + (8*WIDTHRADIUS);
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.stateView);
        make.left.equalTo(stateImg.mas_right).offset(10);
        make.width.equalTo(@(width));
    }];
    [self.stateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width+48));
    }];
    
    /*** 底部 ***/
    self.bottomLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] superView:self.stateView];
    self.bottomLabel.text=@"到达时间";
    self.bottomLabel.textAlignment=NSTextAlignmentCenter;
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-10);
        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
        make.height.equalTo(@28);
    }];
    
    /*** 中间 ***/
    self.centerLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:70 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] superView:self.stateView];
    self.centerLabel.text=@"16:34";
    self.centerLabel.textAlignment=NSTextAlignmentCenter;
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.stateView.mas_bottom).offset(10);
        make.bottom.equalTo(self.bottomLabel.mas_top).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
