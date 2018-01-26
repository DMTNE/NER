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
@property(nonatomic,strong)AppointmentCell *c1;
@end

@implementation AppointmentViewController

- (void)viewDidLoad {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.title  会覆盖appdelegate tabbar的名字
    self.navigationItem.title = @"周边站点";
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3-2, 11, 1, 16)];
    v1.backgroundColor = [UIColor lightGrayColor];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3*2-2, 11, 1, 16)];
    v2.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:v1];
    [self.view addSubview:v2];

    _SegmentedController.tintColor = [UIColor clearColor];
    _SegmentedController.apportionsSegmentWidthsByContent = YES;

    NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName : TEXT_COLOR_PLACEHOLER};
    NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0f],NSForegroundColorAttributeName : THEME_COLOR};
    [_SegmentedController setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    [_SegmentedController setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
    
    _S1TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH, SCREEN_HEIGHT-149) style:UITableViewStylePlain];
    _S1TableView.delegate = self;
    _S1TableView.dataSource = self;
    _S1TableView.separatorStyle = NO;
    [self.view addSubview:_S1TableView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title=@"周边站点";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellIdentifier = @"c1";

    _c1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!_c1)
    {
        _c1 = [[[NSBundle mainBundle]loadNibNamed:@"AppointmentCell" owner:self options:nil] lastObject];
    }
    
    _c1.stationName.text = @"大家塘充电站（0.5km）";
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
    c.getLocationText = _c1.stationName.text;
}

@end
