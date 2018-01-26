//
//  PersonalViewController.m
//  NER
//
//  Created by 方静雯 on 2017/12/4.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "PersonalViewController.h"
#import "PCscTableViewController.h"

@interface PersonalViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arr1,*arr2,*arr3,*arr4,*arr5,*arr6,*arr7,*arr8,*A1,*A2;
    UITableView *pct;
}
@property (weak, nonatomic) IBOutlet UIImageView *PCImage;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pct = [[UITableView alloc] initWithFrame:CGRectMake(0, 210, [UIScreen mainScreen].bounds.size.width, 332) style:UITableViewStyleGrouped];
    pct.delegate = self;
    pct.dataSource = self;
    pct.separatorStyle = NO;
    pct.scrollEnabled = NO;
    pct.backgroundColor = BG_COLOR;
    pct.sectionHeaderHeight = 5.f;
    pct.sectionFooterHeight = 0.01f;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.001)];
    pct.tableHeaderView = view;
    [self.view addSubview:pct];
    
    _PCImage.layer.masksToBounds = YES;
    _PCImage.layer.cornerRadius = 50;   //边缘多少像素变成圆角
    
    [self initData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"我的";
}

- (void)initData {
    arr1 = [[NSMutableArray alloc] initWithObjects:@"当前电量", nil];
    arr2 = [[NSMutableArray alloc] initWithObjects:@"我的余额", nil];
    arr3 = [[NSMutableArray alloc] initWithObjects:@"我的消息",@"我的收藏",@"我的车辆", nil];
    arr4 = [[NSMutableArray alloc] initWithObjects:@"充电记录", nil];
    
    arr5 = [[NSMutableArray alloc] initWithObjects:@"electricity", nil];
    arr6 = [[NSMutableArray alloc] initWithObjects:@"alipay", nil];
    arr7 = [[NSMutableArray alloc] initWithObjects:@"news",@"collection",@"car", nil];
    arr8 = [[NSMutableArray alloc] initWithObjects:@"record", nil];
    
    A1 = [[NSMutableArray alloc] initWithObjects:arr1,arr2,arr3,arr4, nil];
    A2 = [[NSMutableArray alloc] initWithObjects:arr5,arr6,arr7,arr8, nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return A1.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[A1 objectAtIndex:section]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = A1[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:A2[indexPath.section][indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 48;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击后取消cell选中状态
    [pct deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 2 && indexPath.row == 1)
    {
    PCscTableViewController *ToscVC = [[PCscTableViewController alloc] init];
    [self.navigationController pushViewController:ToscVC animated:YES];
    }
    
}

@end
