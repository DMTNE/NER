//
//  NERParkingStateTableView.m
//  NER
//
//  Created by Fangjw on 2017/12/27.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERParkingStateTableView.h"
#import "NERStateIntroduceTableViewCell.h"
#import "NERStateTableViewCell.h"
#import "NERStateBtnTableViewCell.h"

#define NERStateIntroduceTableViewCellID @"NERStateIntroduceTableViewCellID"
#define NERStateTableViewCellID @"NERStateTableViewCellID"
#define NERStateBtnTableViewCellID @"NERStateBtnTableViewCellID"

@interface NERParkingStateTableView()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation NERParkingStateTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    self.dataSource = self;
    self.delegate = self;
    self.estimatedRowHeight = 200;
    self.rowHeight = UITableViewAutomaticDimension;
    self.showsVerticalScrollIndicator=NO;
    self.bounces=NO;
    [self registerTableCell];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

-(void)registerTableCell{
    [self registerClass:[NERStateIntroduceTableViewCell class] forCellReuseIdentifier:NERStateIntroduceTableViewCellID];
    [self registerClass:[NERStateTableViewCell class] forCellReuseIdentifier:NERStateTableViewCellID];
    [self registerClass:[NERStateBtnTableViewCell class] forCellReuseIdentifier:NERStateBtnTableViewCellID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0) {
        return 176;
    }else if(indexPath.row==1) {
        return 186;
    }else{
        return 165;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            NERStateIntroduceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NERStateIntroduceTableViewCellID forIndexPath:indexPath];
            return cell;
        }
            break;
            
        case 1:{
            NERStateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NERStateTableViewCellID forIndexPath:indexPath];
            return cell;
        }
            break;
            
        default:{
            NERStateBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NERStateBtnTableViewCellID forIndexPath:indexPath];
            return cell;
        }
            break;
    }
}

@end
