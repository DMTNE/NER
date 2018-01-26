//
//  PCscTableViewController.m
//  BCP
//
//  Created by Harry on 2017/12/15.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "PCscTableViewController.h"
#import "PersonalCollectCell.h"

@interface PCscTableViewController ()
@property(nonatomic,weak) PersonalCollectCell *ReuseCell1;

@end

@implementation PCscTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的收藏";
    self.tableView.separatorStyle = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellIdentifier = @"c1";
    _ReuseCell1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!_ReuseCell1)
    {
        _ReuseCell1 = [[[NSBundle mainBundle]loadNibNamed:@"PersonalCollectCell" owner:self options:nil] lastObject];
    }
    
    return _ReuseCell1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 146;
}

@end
