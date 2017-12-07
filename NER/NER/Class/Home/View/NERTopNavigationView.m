//
//  NERTopNavigationView.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERTopNavigationView.h"

@interface NERTopNavigationView()

@property (nonatomic, retain) UIButton *adressBtn;

@property (nonatomic, retain) UISearchBar *searchBar;

@property (nonatomic, retain) UIButton *moreBtn;

@end

@implementation NERTopNavigationView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=frame;
        self.backgroundColor=[UIColor lightGrayColor];
        [self createViews];
        [self createConstrains];
    }
    return self;
}

-(void)createViews{
    self.adressBtn = [UIButton new];
    [self.adressBtn setTitle:@"杭州" forState:UIControlStateNormal];
    [self.adressBtn addTarget:self action:@selector(choiceAdressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.adressBtn];
    
    self.searchBar=[UISearchBar new];
    self.searchBar.placeholder=@"请输入地址";
    [self addSubview:self.searchBar];
    
    self.moreBtn = [UIButton new];
    [self.moreBtn setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [self.moreBtn setImage:[UIImage imageNamed:@"list"] forState:UIControlStateHighlighted];
    [self.moreBtn addTarget:self action:@selector(choiceMoreBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreBtn];
}

-(void)createConstrains{
    [self.adressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.equalTo(@64);
        make.height.equalTo(self);
        make.left.equalTo(self);
    }];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-44);
        make.left.equalTo(self.adressBtn.mas_right);
        make.height.equalTo(self);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.equalTo(@44);
        make.height.equalTo(self);
        make.right.equalTo(self);
    }];
}

-(void)choiceAdressBtn{
    
}

-(void)choiceMoreBtn{
    
}

@end
