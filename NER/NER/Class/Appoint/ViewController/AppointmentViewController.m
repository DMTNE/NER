//
//  AppointmentViewController.m
//  BCP
//
//  Created by Harry on 2017/12/13.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "AppointmentViewController.h"
#import "AppointmentChargeViewController.h"
#import "AppointmentCell.h"

@interface AppointmentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentedController;
@property(nonatomic,strong)UITableView *S1TableView;
@property(nonatomic,strong)UITableView *S2TableVeiw;
@property(nonatomic,strong)AppointmentCell *c1;
@end

@implementation AppointmentViewController

- (void)viewDidLoad {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.title  会覆盖appdelegate tabbar的名字
    self.navigationItem.title = @"周边站点";
    
    
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    
    _SegmentedController.tintColor = [UIColor clearColor];
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3-2, 11, 1, 16)];
    v1.backgroundColor = [UIColor lightGrayColor];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3*2-2, 11, 1, 16)];
    v2.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:v1];
    [self.view addSubview:v2];
    // 正常状态下
    NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName : [UIColor grayColor]};
    [_SegmentedController setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    
    // 选中状态下
    NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor colorWithRed:15/255 green:83/255 blue:62/255 alpha:1]};
    [_SegmentedController setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
    
    //指示控件是否根据其内容宽度来调整片段宽度
    _SegmentedController.apportionsSegmentWidthsByContent = YES;
    
    _S1TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 36, [UIScreen mainScreen].bounds.size.width, 518) style:UITableViewStylePlain];
    _S1TableView.delegate = self;
    _S1TableView.dataSource = self;
    [self.view addSubview:_S1TableView];
    
//    _S2TableVeiw = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 518) style:UITableViewStylePlain];
//    _S2TableVeiw.delegate =self;
//    _S2TableVeiw.dataSource =self;
//    [self.view addSubview:_S2TableVeiw];
    
    
}

- (void)setBarTextColor
{
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:15/255 green:83/255 blue:62/255 alpha:1]}];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews)
    {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView)
        {
            return imageView;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellIdentifier = @"c1";
    
    //用注册cell的方法时要用forIndexPath
    //    AppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    //_tableViewCell = [[UITableViewCell alloc] init];
    _c1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!_c1)
    {
        _c1 = [[[NSBundle mainBundle]loadNibNamed:@"AppointmentCell" owner:self options:nil] lastObject];
    }
    
    // Configure the cell...
    
    return _c1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 176;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AppointmentChargeViewController *c = [[AppointmentChargeViewController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"周边站点";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
