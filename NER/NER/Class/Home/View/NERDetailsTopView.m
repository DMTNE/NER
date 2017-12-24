//
//  NERDetailsTopView.m
//  NER
//
//  Created by Fangjw on 2017/12/19.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERDetailsTopView.h"
#import "UILabel+Masonry.h"
#import "UIView+Masonry.h"
#import "UIImageView+Masonry.h"

@interface NERDetailsTopView()

@property (nonatomic, strong) UILabel *topLabel;

@property (nonatomic, strong) UIImageView *topImg;

@property (nonatomic, strong) UILabel *introduceLabel;

@property (nonatomic, strong) UIImageView *introduceImg;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) UIImageView *statusImg;

@end

@implementation NERDetailsTopView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=frame;
        self.backgroundColor=[UIColor whiteColor];
        [self createViews];
    }
    return self;
}

-(void)createViews{
    UIView *backView=[UIView viewbackClolr:SECOND_COLOR superView:self];
    
    self.topLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] superView:backView];
    self.topLabel.text=@"xxx";
    self.topImg=[UIImageView imgWithBackClolr:nil image:[UIImage imageNamed:@"bluestation"] superView:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@64);
    }];
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backView);
    }];
    [self.topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topLabel.mas_left).offset(-10);
        make.height.width.equalTo(@20);
        make.centerY.equalTo(self.topLabel);
    }];
    
    UIView *secBackView=[UIView viewbackClolr:[UIColor whiteColor] superView:self];
    
    self.introduceLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:secBackView];
    self.introduceLabel.text=@"xxx";
    self.introduceImg=[UIImageView imgWithBackClolr:nil image:[UIImage imageNamed:@"tagyellow"] superView:secBackView];
    
    self.statusLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:secBackView];
    self.statusLabel.text=@"xxx";
    self.statusImg=[UIImageView imgWithBackClolr:nil image:[UIImage imageNamed:@"tagblue"] superView:secBackView];
    
    [secBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(backView.mas_bottom);
        make.height.equalTo(@62);
    }];
    [self.statusImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(secBackView);
        make.height.width.equalTo(@20);
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.statusImg.mas_right).offset(10);
        make.centerY.equalTo(self.statusImg);
    }];
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.statusImg.mas_left).offset(-15);
        make.centerY.equalTo(self.statusImg);
    }];
    [self.introduceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.introduceLabel.mas_left).offset(-10);
        make.centerY.equalTo(self.statusImg);
        make.height.width.equalTo(@20);
    }];
    
    UIView *lineView=[UIView viewbackClolr:LINE_COLOR superView:self];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.right.bottom.equalTo(self);
    }];
}

@end
