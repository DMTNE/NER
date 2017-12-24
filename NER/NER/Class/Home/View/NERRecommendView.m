//
//  NERRecommendView.m
//  NER
//
//  Created by Fangjw on 2017/12/11.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERRecommendView.h"
#import "UILabel+Masonry.h"
#import "UIButton+Masonry.h"
#import "UIImageView+Masonry.h"

@interface NERRecommendView()

@property (nonatomic, strong) UIImageView *recommendImageView;

@property (nonatomic, strong) UILabel *recommendLabel;

@property (nonatomic, strong) UIButton *recommendBtn;

@property (nonatomic, strong) UIButton *navigationBtn;

@end

@implementation NERRecommendView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=frame;
        self.backgroundColor=THEME_COLOR;
        self.layer.cornerRadius=10;
        self.layer.masksToBounds=YES;
        [self createViewsConstrains];
    }
    return self;
}

-(void)createViewsConstrains{
    self.recommendImageView=[UIImageView imgWithBackClolr:[UIColor clearColor] image:[UIImage imageNamed:@"star"] superView:self];
    self.recommendLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular] textClolr:[UIColor whiteColor] superView:self];
    self.recommendLabel.text=@"智能推荐";
    
    self.recommendBtn=[UIButton buttonWithFont:nil textClolr:nil backClolr:nil radius:0 superView:self];
    [self.recommendBtn addTarget:self action:@selector(recommendClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationBtn=[UIButton buttonWithFont:nil textClolr:nil backClolr:[UIColor whiteColor] radius:0 superView:self];
    [self.navigationBtn setImage:[UIImage imageNamed:@"location2-1"] forState:UIControlStateNormal];
    [self.navigationBtn addTarget:self action:@selector(navigationClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.recommendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@65);
    }];
    [self.recommendImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.recommendBtn).offset(-10);
    }];
    [self.recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.recommendImageView.mas_bottom).offset(10);
    }];
    [self.navigationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.recommendBtn.mas_bottom);
    }];
}

-(void)recommendClick{
    if (self.recommendBlock) {
        self.recommendBlock();
    }
}
-(void)navigationClick{
    if (self.navigationBlock) {
        self.navigationBlock();
    }
}

@end
