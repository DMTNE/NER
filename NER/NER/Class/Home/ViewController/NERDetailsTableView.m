//
//  NERDetailsTableView.m
//  NER
//
//  Created by Fangjw on 2017/12/19.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERDetailsTableView.h"
#import "NERDetailsTableViewCell.h"
#import "NERDetailsTopView.h"

#define NERDetailsTableViewCellID @"NERDetailsTableViewCellID"

@interface NERDetailsTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NERDetailsTopView *topView;

@end

@implementation NERDetailsTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    self.dataSource = self;
    self.delegate = self;
    self.estimatedRowHeight = 200;
    self.rowHeight = UITableViewAutomaticDimension;
    self.showsVerticalScrollIndicator=NO;
    self.bounces=NO;
    [self registerTableCell];
    [self setHeaderView];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor whiteColor];

    return self;
}

-(void)registerTableCell{
    [self registerClass:[NERDetailsTableViewCell class] forCellReuseIdentifier:NERDetailsTableViewCellID];
}

-(void)setHeaderView{
    self.topView=[[NERDetailsTopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 126)];
    self.tableHeaderView=self.topView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NERDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NERDetailsTableViewCellID forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            [cell updateView:[UIImage imageNamed:@"tagyellow"] cellType:NERDetailsCellIntroduce labelArray:@[@"充电桩编号：",@"车位号：",@"123456789123456789",@"1234"]];
            break;
        case 1:
            [cell updateView:[UIImage imageNamed:@"tagyellow"] cellType:NERDetailsCellEle labelArray:@[@"国际GB/T20234（插电式）电桩",@"单相交流 220V | 32A | 7KW"]];
            break;
        case 2:
            [cell updateView:[UIImage imageNamed:@"tagyellow"] cellType:NERDetailsCellCharge labelArray:@[@"收费详情：峰时：1.1123元／度，平时0.7892元／度，谷时：0.31元／度（以入网用户收费标准协议为准）"]];
            break;
    }
    
    return cell;
 
            
}




@end
