//
//  NERMenuButton.m
//  NER
//
//  Created by Fangjw on 2017/12/11.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERMenuButton.h"
#import "UIImageView+Masonry.h"

#define CellID @"Cell_ID"

@interface NERMenuButton()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UIImageView *menuImageView;

@property (nonatomic, strong)NSArray *menuArray;

@property (nonatomic, strong)NSArray *listArray;

@property (nonatomic, strong)UITableView *menuTableView;

@property (nonatomic, assign)BOOL hideMenu;

@end

@implementation NERMenuButton

-(instancetype)initWithFrame:(CGRect)frame menuArray:(NSArray *)menuArray listArray:(NSArray *)listArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=frame;
        self.menuArray=menuArray;
        self.listArray=listArray;
        self.hideMenu=YES;
        [self createView];
    }
    return self;
}

-(void)createView{
    self.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [self setTitleColor:TEXT_COLOR_TITLE forState:UIControlStateNormal];
   
    [self setTitle:@"杭州" forState:UIControlStateNormal];
    [self addTarget:self action:@selector(choiceAdressBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.menuImageView=[UIImageView imgWithBackClolr:nil image:[UIImage imageNamed:@"Triangle2"] superView:self];
    [self.menuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self);
    }];
    
    self.menuTableView=[[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
    self.menuTableView.delegate=self;
    self.menuTableView.dataSource=self;
    self.menuTableView.bounces=NO;
    self.menuTableView.showsVerticalScrollIndicator=NO;
    [self.menuTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.menuTableView setLayoutMargins:UIEdgeInsetsZero];
    [self addSubview:self.menuTableView];
    [self.menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
        make.centerX.equalTo(self);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@(self.listArray.count*40>200?200:self.listArray.count*40));
    }];
    self.menuTableView.alpha=0;
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.textLabel.text=self.listArray[indexPath.row];
    }
    cell.selectedBackgroundView.backgroundColor =[UIColor lightGrayColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

-(void)choiceAdressBtn{
    if (self.hideMenu) {
        self.menuTableView.alpha=1;
        [UIView animateWithDuration:1 animations:^{
        }];
    }else{
        self.menuTableView.alpha=0;
    }
    self.hideMenu = !self.hideMenu;
}


@end
