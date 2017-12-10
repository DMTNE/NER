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

@interface NERHomeViewController()<BMKMapViewDelegate,BMKLocationServiceDelegate>{
    
    BMKLocationService *_locService;
    NSMutableArray *annotationArray;
    
}

@property (strong, nonatomic) BMKMapView *mapView;

@property (nonatomic, strong) NERTopNavigationView *topNavigationView;

@property (nonatomic, strong) NERChoiceView *choiceView;



@end

@implementation NERHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMap];
    [self createTopView];
    
    _choiceView=[[NERChoiceView alloc]init];
    [self.view addSubview:_choiceView];
    [_choiceView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.equalTo(@175);
    }];
    
    _choiceView.layer.shadowOpacity=0.35;
    CGMutablePathRef ref=CGPathCreateMutable();
    CGPathAddRect(ref, NULL, _choiceView.bounds);
    _choiceView.layer.shadowPath=ref;
    CGPathRelease(ref);
    
    _choiceView.alpha=0;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTopView{
    _topNavigationView=[[NERTopNavigationView alloc]init];
    [self.view addSubview:_topNavigationView];
    [_topNavigationView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@64);
        }
    ];
}

-(void)createMap{
    _mapView = [[BMKMapView alloc] init];
    [self.view addSubview:_mapView];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.view);
    }];
    
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
    _locService.delegate = self;
    //设置定位精确度，默认：kCLLocationAccuracyBest
    _locService.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    _locService.distanceFilter =  10.f;
    //启动LocationService
    [_locService startUserLocationService];
    [_mapView setShowMapScaleBar:NO];
    [_mapView setMapScaleBarPosition:CGPointMake(12, SCREEN_HEIGHT-64-50)];
    
    //定位点
    annotationArray=[[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
        BMKPointAnnotation *annotation=[[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 39.915+i*0.01;
        coor.longitude = 116.404+i*0.01;
        annotation.coordinate = coor;
        [annotationArray addObject:annotation];
    }
    [_mapView addAnnotations:annotationArray];
    
}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKAnnotationView *annotationView=[[BMKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"Annotation"];
        annotationView.canShowCallout=NO;
        annotationView.annotation=annotation;
        annotationView.image=[UIImage imageNamed:@"location"];
        
        return annotationView;
    }
    return nil;
}

-(void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
{
    [self.view endEditing:YES];
    _choiceView.alpha=0;
}

-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    [self.view endEditing:YES];
    view.canShowCallout=NO;
    _choiceView.alpha=1;
}

@end
