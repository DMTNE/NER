//
//  NERHomeViewController.m
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERHomeViewController.h"
#import "NERTopNavigationView.h"
#import "NERChoiceView.h"
#import "NERRecommendView.h"
#import "NERMenuButton.h"
#import "NERDetailsViewController.h"
#import "UserInformation.h"

@interface NERHomeViewController()<BMKMapViewDelegate,BMKLocationServiceDelegate,NERChoiceViewDelegate,NERMenuButtonDelegate,NERTopNavigationViewDelegate,UITableViewDelegate,UITableViewDataSource,BMKSuggestionSearchDelegate>{

    NSMutableArray *annotationArray;
    BMKPointAnnotation* myAnnotation;
    BMKPointAnnotation* siteAnnotation;
    NSMutableArray *searchArray;
    NSMutableArray *cllocationArray;
}

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@property (strong, nonatomic) BMKMapView *mapView;

@property (nonatomic, strong) BMKLocationService *locService;

@property (nonatomic,strong) BMKSuggestionSearch *searcher;

@property (nonatomic,strong)  BMKSuggestionSearchOption *option;

@property (nonatomic, strong) NERTopNavigationView *topNavigationView;

@property (nonatomic, strong) NERChoiceView *choiceView;

@property (strong, nonatomic) NERRecommendView *recommendView;

@property (nonatomic, retain) NERMenuButton *adressBtn;

@property (nonatomic, strong) UIView *choiceBackView;

@property (nonatomic, strong) UITableView *searchTableView;

@end

@implementation NERHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMap];
    [self createChoiceView];
    [self createOtherView];
    [self createTopView];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    _searcher.delegate = self;
    _locService.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    if ([UserInformation sharedInstance].ifPop) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    _searcher.delegate = nil;
    _locService.delegate = nil;
}
-(void)viewDidDisappear:(BOOL)animated
{
    if (![UserInformation sharedInstance].ifPop) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
        [UserInformation sharedInstance].ifPop=![UserInformation sharedInstance].ifPop;
    }
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [self getLocation];
}

-(void)createChoiceView{

    _choiceBackView=[[UIView alloc]initWithFrame:CGRectMake(10, SCREEN_HEIGHT, SCREEN_WIDTH-20, 175)];
    [self.view addSubview:_choiceBackView];
    
    _choiceView=[[NERChoiceView alloc]init];
    _choiceView.nerChoiceViewDelegate=self;
    [_choiceBackView addSubview:_choiceView];
    [_choiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_choiceBackView);
    }];
    
    _choiceBackView.layer.shadowOpacity=0.35;
    CGMutablePathRef ref=CGPathCreateMutable();
    CGPathAddRect(ref, NULL, _choiceBackView.bounds);
    _choiceBackView.layer.shadowPath=ref;
    _choiceBackView.layer.shadowOffset=CGSizeMake(1, 0);
    _choiceBackView.layer.shadowColor=[UIColor blackColor].CGColor;
    CGPathRelease(ref);
    
    _choiceBackView.alpha=0;
}

-(void)createTopView{
    _topNavigationView=[[NERTopNavigationView alloc]init];
    _topNavigationView.nerTopNavigationViewDelegate=self;
    [self.view addSubview:_topNavigationView];
    [_topNavigationView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@64);
        }
    ];
    self.navigationItem.titleView = _topNavigationView;
    self.adressBtn = [[NERMenuButton alloc]initWithFrame:CGRectNull menuArray:@[@"杭州"] listArray:@[@"杭州",@"北京",@"上海",@"广州",@"香港",@"深圳",@"西安"]];
    self.adressBtn.userInteractionEnabled=YES;
    self.adressBtn.nerMenuButtonDelegate=self;
    [self.view addSubview:self.adressBtn];
    
    [self.adressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(18);
        make.width.equalTo(@64);
        make.height.equalTo(@250);
        make.left.equalTo(self.view);
    }];
    
    if (!_tapGestureRecognizer) {
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToBack:)];
        self.tapGestureRecognizer.numberOfTapsRequired=1;
    }
    [_topNavigationView addGestureRecognizer:self.tapGestureRecognizer];
}

-(void)tapToBack:(UITapGestureRecognizer *)tap{
    [_topNavigationView closeSearch];
}

-(void)createOtherView{
    _recommendView=[[NERRecommendView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-62, SCREEN_HEIGHT-176, 52, 112)];
    [self.view addSubview:_recommendView];
    _recommendView.recommendBlock = ^{
        
    };
    __weak typeof(self) weakSelf = self;
    _recommendView.navigationBlock = ^{
        [weakSelf getLocation];
    };
}
//定位
-(void)getLocation{
    _mapView.centerCoordinate=self.locService.userLocation.location.coordinate;
    //定位点
    annotationArray=[[NSMutableArray alloc]init];
    siteAnnotation=[[BMKPointAnnotation alloc]init];
    for (int i=1; i<4; i++) {
        siteAnnotation=[[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = self.locService.userLocation.location.coordinate.latitude+i*0.01;
        coor.longitude = self.locService.userLocation.location.coordinate.longitude+i*0.01;
        siteAnnotation.coordinate = coor;
        [annotationArray addObject:siteAnnotation];
    }
    [_mapView addAnnotations:annotationArray];
    
    myAnnotation=[[BMKPointAnnotation alloc]init];
    myAnnotation.coordinate = _locService.userLocation.location.coordinate;
    [_mapView addAnnotation:myAnnotation];
}

-(void)createMap{
    _mapView = [[BMKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_mapView];
    //普通矢量图
    [_mapView setMapType:BMKMapTypeStandard];
    
#pragma mark 地图设置
    _mapView.delegate=self;
    _mapView.rotateEnabled=NO;
    _mapView.zoomLevel=14;
    BMKLocationViewDisplayParam* param = [[BMKLocationViewDisplayParam alloc] init];
    param.isAccuracyCircleShow =NO;//设置是否显示定位的那个精度圈
    param.isRotateAngleValid = YES;
    [_mapView updateLocationViewWithParam:param];
    
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    //设置定位精确度，默认：kCLLocationAccuracyBest
    _locService.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    _locService.distanceFilter =  10.f;
    //启动LocationService
    [_locService startUserLocationService];
    [_mapView setShowMapScaleBar:NO];
    [_mapView setMapScaleBarPosition:CGPointMake(12, SCREEN_HEIGHT-64-50)];
    
    _searcher =[[BMKSuggestionSearch alloc]init];
    _searcher.delegate = self;
    _option = [[BMKSuggestionSearchOption alloc] init];
    _option.cityname = @"杭州市";
    _option.keyword  = @"";
    BOOL flag = [_searcher suggestionSearch:_option];
    if(flag)
    {NSLog(@"建议检索发送成功");}else
    {NSLog(@"建议检索发送失败");}

}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    
    BMKAnnotationView *annotationView=[[BMKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"Annotation"];
    annotationView.canShowCallout=NO;
    annotationView.annotation=annotation;
    
    if (annotation == myAnnotation){
         annotationView.image=[UIImage imageNamed:@"location2"];
    }else if (annotation == siteAnnotation){
         annotationView.image=[UIImage imageNamed:@"location"];
    }

    return annotationView;

}

-(void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
{
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.5 animations:^{
        _choiceBackView.frame=CGRectMake(10, SCREEN_HEIGHT, SCREEN_WIDTH-20, 175);
        _choiceBackView.alpha=0;
        _recommendView.frame=CGRectMake(SCREEN_WIDTH-62, SCREEN_HEIGHT-176, 52, 112);
    }];
}

-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    [self.view endEditing:YES];
    view.canShowCallout=NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        _choiceBackView.frame=CGRectMake(10, SCREEN_HEIGHT-259, SCREEN_WIDTH-20, 175);
        _choiceBackView.alpha=1;
        _recommendView.frame=CGRectMake(SCREEN_WIDTH-62, SCREEN_HEIGHT-391, 52, 112);
    }];
    
}

#pragma --- NERChoiceViewDelegate
-(void)toDetailsView{
    NERDetailsViewController *vc=[[NERDetailsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)saveThis{
    
}

#pragma --- NERMenuButtonDelegate
-(void)choiceMenu:(NSInteger)choiceCount{
}

#pragma --- NERTopNavigationViewDelegate
-(void)nerTopNavigationViewSearchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    _option = [[BMKSuggestionSearchOption alloc] init];
    _option.cityname = @"杭州市";
    _option.keyword = searchBar.text;
    [_searcher suggestionSearch:_option];

    BOOL flag = [_searcher suggestionSearch:_option];
    if(flag)
    {NSLog(@"建议检索发送成功");}else
    {NSLog(@"建议检索发送失败");}
}

- (void)onGetSuggestionResult:(BMKSuggestionSearch*)searcher result:(BMKSuggestionResult*)result errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
        searchArray=[NSMutableArray new];
        cllocationArray=[NSMutableArray new];
        for (int i=0; i<result.keyList.count; i++) {
            NSString *str=[NSString stringWithFormat:@"%@%@%@",result.cityList[i],result.districtList[i],result.keyList[i]];
            [searchArray addObject:str];
            
            CLLocationCoordinate2D Coordinate;
            [result.ptList[i] getValue:&Coordinate];

        }
       [self.searchTableView reloadData];
    }
    else {
        NSLog(@"抱歉，未找到结果");
    }
}

- (void)nerTopNavigationViewSearchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self createTableView];
    self.searchTableView.hidden=NO;
}

- (void)nerTopNavigationViewSearchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length<=0){
      self.searchTableView.hidden=YES;
      [_topNavigationView closeSearch];
    }
}

-(void)createTableView{
    if (!_searchTableView) {
        self.searchTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        self.searchTableView.delegate=self;
        self.searchTableView.dataSource=self;
        self.searchTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view insertSubview:self.searchTableView aboveSubview:self.recommendView];
        self.searchTableView.hidden=YES;
        
//        if (!_tapGestureRecognizer) {
//            self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToBack:)];
//            self.tapGestureRecognizer.numberOfTapsRequired=1;
//        }
//        [self.searchTableView addGestureRecognizer:self.tapGestureRecognizer];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch {
    
    if ([touch.view isKindOfClass:[UIScrollView class]]) {
        return YES;
    }
    return NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return searchArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text=searchArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NERDetailsViewController *vc=[[NERDetailsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
