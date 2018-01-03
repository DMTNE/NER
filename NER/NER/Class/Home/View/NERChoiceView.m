//
//  NERChoiceView.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERChoiceView.h"
#import "UILabel+Masonry.h"
#import "UIButton+Masonry.h"
#import "UIView+Masonry.h"
#import "UIImageView+Masonry.h"

@interface NERChoiceView()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *saveView;

@property (nonatomic, strong) UIButton *saveBtn;

@property (nonatomic, strong) UILabel *saveLabel;

@property (nonatomic, strong) UIView *detailsView;

@property (nonatomic, strong) UILabel *operatorLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *chargLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIImageView *locationImg;

@property (nonatomic, strong) UILabel *locationLabel;

@property (nonatomic, strong) UIButton *detailsBtn;

@end

@implementation NERChoiceView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=frame;
        self.backgroundColor=[UIColor whiteColor];
        self.layer.cornerRadius=10;
        self.layer.masksToBounds=YES;
        [self createViewsConstrains];
    }
    return self;
}

-(void)createViewsConstrains{
    self.nameLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:self];
    self.nameLabel.text=@"xxx充电站（xxkm）";
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.height.equalTo(@44);
        make.left.equalTo(self).offset(10);
    }];
    
    self.saveView=[UIView viewbackClolr:[UIColor colorWithRed:241/255. green:240/255. blue:238/255. alpha:1] superView:self];
    self.saveView.layer.cornerRadius=4;
    self.saveLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE superView:self.saveView];
    self.saveLabel.text=@"收藏";
    self.saveBtn=[UIButton buttonWithFont:nil textClolr:nil backClolr:nil radius:0 superView:self.saveView];
    [self.saveBtn setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
     [self.saveBtn setImage:[UIImage imageNamed:@"collection"] forState:UIControlStateSelected];
    [self.saveBtn addTarget:self action:@selector(toSave) forControlEvents:UIControlEventTouchUpInside];
    
    [self.saveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.height.equalTo(@25);
        make.width.equalTo(@54);
        make.right.equalTo(self).offset(-10);
    }];
    [self.saveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.saveView);
        make.right.equalTo(self.saveView.mas_right).offset(-5);
    }];
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.saveView);
        make.left.equalTo(self.saveView.mas_left).offset(5);
        make.width.height.equalTo(@15);
    }];
    
    self.detailsView=[UIView viewbackClolr:[UIColor colorWithRed:245/255. green:246/255. blue:240/255. alpha:1] superView:self];
    
    UILabel *operatorTitle=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.detailsView];
    operatorTitle.text=@"运营商：";
    UILabel *priceTitle=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.detailsView];
    priceTitle.text=@"价格：";
    UILabel *chargTitle=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.detailsView];
    chargTitle.text=@"充电桩：";
    UILabel *timeTitle=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.detailsView];
    timeTitle.text=@"时间：";
    
    [self.detailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(44, 0, 0, 0));
    }];
    [operatorTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detailsView).offset(10);
        make.top.equalTo(self.detailsView).offset(10);
    }];
    
    [priceTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(operatorTitle);
        make.left.equalTo(self.detailsView.mas_centerX);
    }];
    [chargTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(operatorTitle);
        make.top.equalTo(operatorTitle.mas_bottom).offset(10);
    }];
    
    [timeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(priceTitle);
        make.top.equalTo(priceTitle.mas_bottom).offset(10);
    }];
    
    self.operatorLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:self.detailsView];
    self.operatorLabel.text=@"xxx";
    self.priceLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:self.detailsView];
    self.priceLabel.text=@"xxx元/小时";
    self.chargLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:self.detailsView];
    self.chargLabel.text=@"xxx(个)";
    self.timeLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightMedium] textClolr:TEXT_COLOR_TITLE superView:self.detailsView];
    self.timeLabel.text=@"xx:xx~xx:xx";
    
    [self.operatorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(operatorTitle);
        make.left.equalTo(operatorTitle.mas_right).offset(5);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(priceTitle);
        make.left.equalTo(priceTitle.mas_right).offset(5);
    }];
    [self.chargLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(chargTitle);
        make.left.equalTo(chargTitle.mas_right).offset(5);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(timeTitle);
        make.left.equalTo(timeTitle.mas_right).offset(5);
    }];
    
    self.locationImg=[UIImageView imgWithBackClolr:[UIColor clearColor] image:[UIImage imageNamed:@"green"] superView:self.detailsView];
    self.locationLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_MAIN superView:self.detailsView];
    self.locationLabel.text=@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    
    self.detailsBtn=[UIButton buttonWithFont:nil textClolr:nil backClolr:[UIColor clearColor] radius:0 superView:self.detailsView];
    [self.detailsBtn addTarget:self action:@selector(toDetails) forControlEvents:UIControlEventTouchUpInside];
    [self.detailsBtn setImage:[UIImage imageNamed:@"go"] forState:UIControlStateNormal];
    
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.left.equalTo(self).offset(40);
        make.right.equalTo(self).offset(-80);
    }];
    [self.locationImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.locationLabel.mas_left).offset(-5);
        make.centerY.equalTo(self.locationLabel);
    }];
    [self.detailsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.locationLabel.mas_right).offset(10);
        make.centerY.equalTo(self.locationLabel);
        make.width.equalTo(@54);
    }];
}

-(void)updateView:(NSDictionary *)updateDic{
    self.nameLabel.text=updateDic[@"name"];
    self.operatorLabel.text=updateDic[@"operator"];
    self.priceLabel.text=updateDic[@"price"];
    self.chargLabel.text=updateDic[@"charg"];
    self.timeLabel.text=updateDic[@"time"];
    self.locationLabel.text=updateDic[@"location"];
}

-(void)toDetails{
    if (self.nerChoiceViewDelegate && [self.nerChoiceViewDelegate respondsToSelector:@selector(toDetailsView)]) {
        [self.nerChoiceViewDelegate toDetailsView];
    }
}

-(void)toSave{
    self.saveBtn.selected=!self.saveBtn.selected;
    if (self.nerChoiceViewDelegate && [self.nerChoiceViewDelegate respondsToSelector:@selector(saveThis)]) {
        [self.nerChoiceViewDelegate saveThis];
    }
}

@end
