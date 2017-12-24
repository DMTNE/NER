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
    pct = [[UITableView alloc] initWithFrame:CGRectMake(0, 205, [UIScreen mainScreen].bounds.size.width, 332) style:UITableViewStyleGrouped];
    //如果这里不写这两个代理 就在xib里面把tableview的这两个属性拉到file's owner里面
    pct.delegate = self;
    pct.dataSource = self;
    
    pct.sectionHeaderHeight = 5;
    pct.sectionFooterHeight = 5;
    pct.tableFooterView = [[UIView alloc] init];
    //    self.PCDetail.tableFooterView = [[UIView alloc] init];
    
    pct.separatorStyle = NO;
    //    _PCDetail.separatorStyle = NO;//隐藏
    
    //隐藏导航栏黑线  还可以创建一个高度为1的view遮住他
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    
    _PCImage.layer.masksToBounds = YES;
    _PCImage.layer.cornerRadius = 50;   //边缘多少像素变成圆角
    
    //    arr1 = [[NSMutableArray alloc] initWithObjects:@"当前电量",@"我的余额",@"我的消息",@"我的收藏",@"我的车辆",@"充电记录", nil];
    arr1 = [[NSMutableArray alloc] initWithObjects:@"当前电量", nil];
    arr2 = [[NSMutableArray alloc] initWithObjects:@"我的余额", nil];
    arr3 = [[NSMutableArray alloc] initWithObjects:@"我的消息",@"我的收藏",@"我的车辆", nil];
    arr4 = [[NSMutableArray alloc] initWithObjects:@"充电记录", nil];
    
    //    arr5 = [[NSMutableArray alloc] initWithObjects:@"electricity",@"alipay",@"news",@"collection",@"车辆",@"record", nil];
    arr5 = [[NSMutableArray alloc] initWithObjects:@"electricity", nil];
    arr6 = [[NSMutableArray alloc] initWithObjects:@"alipay", nil];
    arr7 = [[NSMutableArray alloc] initWithObjects:@"news",@"collection",@"car", nil];
    arr8 = [[NSMutableArray alloc] initWithObjects:@"record", nil];
    
    A1 = [[NSMutableArray alloc] initWithObjects:arr1,arr2,arr3,arr4, nil];
    A2 = [[NSMutableArray alloc] initWithObjects:arr5,arr6,arr7,arr8, nil];
    
    [self.view addSubview:pct];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return A1.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[A1 objectAtIndex:section]count];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.1;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.1;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = A1[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:A2[indexPath.section][indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    if(indexPath.section==0)
    //    {
    //        pct.sectionHeaderHeight=0.1;
    //
    //    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 5.0;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 5.0;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 48;
}
//隐藏导航栏横线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCscTableViewController *ToscVC = [[PCscTableViewController alloc] init];
    [self.navigationController pushViewController:ToscVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"我的";
}

@end
