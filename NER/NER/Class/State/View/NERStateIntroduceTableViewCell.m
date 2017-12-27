//
//  NERStateIntroduceTableViewCell.m
//  NER
//
//  Created by Fangjw on 2017/12/27.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERStateIntroduceTableViewCell.h"
#import "UILabel+Masonry.h"
#import "UIView+Masonry.h"
#import "UIImageView+Masonry.h"

@interface NERStateIntroduceTableViewCell()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *startView;

@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) UILabel *quickLabel;

@property (nonatomic, strong) UILabel *quickLeftLabel;

@property (nonatomic, strong) UILabel *slowLabel;

@property (nonatomic, strong) UILabel *slowLeftLabel;

@end

@implementation NERStateIntroduceTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
    }
    return self;
}

-(void)createView{
   /*** 站点名 ***/
    self.nameLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:self.contentView];
    self.nameLabel.text=@"xxx充电站（xxkm）";
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
    }];
  /*** 星级 ***/
    self.startView=[UIView viewbackClolr:[UIColor blackColor] superView:self.contentView];
    [self.startView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@14);
    }];
  /*** 分割线 ***/
    UIView *vLineV=[UIView viewbackClolr:LINE_COLOR superView:self.contentView];
    [vLineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
        make.height.equalTo(@1);
        make.top.equalTo(self.startView.mas_bottom).offset(10);
    }];
  /*** 地址 ***/
    UIImageView *addressImg=[UIImageView imgWithBackClolr:[UIColor whiteColor] image:[UIImage imageNamed:@"location"] superView:self.contentView];
    [addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.height.width.equalTo(@20);
        make.top.equalTo(vLineV.mas_bottom).offset(10);
    }];
    
    self.addressLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.contentView];
    self.addressLabel.text=@"xxxxxxxxxxxxxxxxxxxxxx";
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addressImg);
        make.left.equalTo(addressImg.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
 /*** 支付支持 ***/
    UIImageView *payImg=[UIImageView imgWithBackClolr:[UIColor whiteColor] image:[UIImage imageNamed:@"pay"] superView:self.contentView];
    [payImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.height.width.equalTo(@20);
        make.top.equalTo(addressImg.mas_bottom).offset(10);
    }];
  
    UILabel *payLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.contentView];
    payLabel.text=@"支付支持：";
    [payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(payImg);
        make.left.equalTo(payImg.mas_right).offset(10);
    }];
 /*** 充电桩个数 ***/
    UIImageView *eleImg=[UIImageView imgWithBackClolr:[UIColor whiteColor] image:[UIImage imageNamed:@"station"] superView:self.contentView];
    [eleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.height.width.equalTo(@20);
        make.top.equalTo(payImg.mas_bottom).offset(10);
    }];
    
    self.quickLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.contentView];
    self.quickLabel.text=@"快充：xx";
    self.quickLabel.textAlignment=NSTextAlignmentLeft;
    [self.quickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(eleImg);
        make.left.equalTo(eleImg.mas_right).offset(10);
        make.width.equalTo(@77);
    }];
    
    self.quickLeftLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.contentView];
    self.quickLeftLabel.text=@"空闲：xx";
    self.quickLeftLabel.textAlignment=NSTextAlignmentLeft;
    [self.quickLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(eleImg);
        make.left.equalTo(self.quickLabel.mas_right).offset(22);
        make.width.equalTo(@77);
    }];

    /*** 分割线 ***/
    UIView *hLineV=[UIView viewbackClolr:LINE_COLOR superView:self.contentView];
    [hLineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.quickLeftLabel.mas_right).offset(23);
        make.width.equalTo(@1);
        make.height.equalTo(@16);
        make.centerY.equalTo(eleImg);
    }];

    self.slowLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.contentView];
    self.slowLabel.text=@"慢充：xx";
    self.slowLabel.textAlignment=NSTextAlignmentLeft;
    [self.slowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(eleImg);
        make.left.equalTo(hLineV.mas_right).offset(23);
        make.width.equalTo(@77);
    }];

    self.slowLeftLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.contentView];
    self.slowLeftLabel.text=@"空闲：xx";
    self.slowLeftLabel.textAlignment=NSTextAlignmentLeft;
    [self.slowLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(eleImg);
        make.left.equalTo(self.slowLabel.mas_right).offset(22);
        make.width.equalTo(@77);
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
