//
//  NERTopNavigationView.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERTopNavigationView.h"
#import "UIButton+Masonry.h"

@interface NERTopNavigationView()<UISearchBarDelegate>

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
        self.backgroundColor=[UIColor colorWithRed:247/255. green:246/255. blue:243/255. alpha:1];
        [self createViews];
        [self createConstrains];
    }
    return self;
}

-(void)createViews{
    self.adressBtn = [UIButton buttonWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:TEXT_COLOR_TITLE backClolr:nil radius:0 superView:self];
    [self.adressBtn setTitle:@"杭州" forState:UIControlStateNormal];
    [self.adressBtn addTarget:self action:@selector(choiceAdressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.adressBtn];
    
    self.searchBar=[UISearchBar new];
    self.searchBar.placeholder=@"请输入地址";
    self.searchBar.delegate=self;
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    UITextField *searchField=[_searchBar valueForKey:@"_searchField"];
    searchField.backgroundColor=[UIColor colorWithRed:233/255. green:233/255. blue:231/255. alpha:1];
    [self addSubview:self.searchBar];
    
    self.moreBtn = [UIButton new];
    [self.moreBtn setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [self.moreBtn setImage:[UIImage imageNamed:@"list"] forState:UIControlStateHighlighted];
    [self.moreBtn addTarget:self action:@selector(choiceMoreBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreBtn];
}

-(void)createConstrains{
    [self.adressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.width.equalTo(@64);
        make.height.equalTo(@44);
        make.left.equalTo(self);
    }];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-44);
        make.left.equalTo(self.adressBtn.mas_right);
        make.height.equalTo(@44);
        make.bottom.equalTo(self);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@44);
        make.height.equalTo(@44);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
     [self.searchBar becomeFirstResponder];
}

-(void)choiceAdressBtn{
    
}

-(void)choiceMoreBtn{
    
}

@end
