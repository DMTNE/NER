//
//  NERQrcodeViewController.m
//  NER
//
//  Created by Fangjw on 2017/12/12.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import "NERQrcodeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "UILabel+Masonry.h"

#define HEIGHTOFSCREEN [[UIScreen mainScreen] bounds].size.height
#define WIDTHOFSCREEN [[UIScreen mainScreen] bounds].size.width
#define WIDTHRADIUS (WIDTHOFSCREEN/375.0)

#define TOPDIS  (WIDTHOFSCREEN-235*WIDTHRADIUS)/2
#define LEFTDIS (HEIGHTOFSCREEN-235*WIDTHRADIUS)/2

#define CENTERRECT CGRectMake(TOPDIS, LEFTDIS, 235*WIDTHRADIUS, 235*WIDTHRADIUS)

@interface NERQrcodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>{
    NSTimer *timer;
    CGFloat moveDis;
    BOOL ifDown;
}

@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;

@property (nonatomic, strong) UIImageView * line;

@end

@implementation NERQrcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
   
    [self createBackView];
    [self createTopView];
    [self createButtomView];
    
    [self performSelector:@selector(setupCamera) withObject:nil afterDelay:0.2];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)createBackView{

    CAShapeLayer *layer=[[CAShapeLayer alloc]init];
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathAddRect(path, nil, CENTERRECT);
    CGPathAddRect(path, nil, self.view.bounds);
                        
    [layer setFillRule:kCAFillRuleEvenOdd];
    [layer setPath:path];
    [layer setFillColor:[UIColor blackColor].CGColor];
    [layer setOpacity:0.6];
                        
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
    
    UIImageView *image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scan"]];
    image.frame=CENTERRECT;
    [self.view addSubview:image];
    
    _line=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scanRectangle"]];
    _line.frame=CGRectMake(TOPDIS, LEFTDIS, 235*WIDTHRADIUS, 1);
    [self.view addSubview:_line];
    
    ifDown=YES;
    moveDis=0;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(lineAnim) userInfo:nil repeats:YES];
}

-(void)lineAnim{
    if (ifDown) {
         moveDis++;
        _line.frame=CGRectMake(TOPDIS, LEFTDIS+moveDis, 235*WIDTHRADIUS, 1);
        if (moveDis>235*WIDTHRADIUS) {
            ifDown=!ifDown;
        }
    }else{
        moveDis--;
        _line.frame=CGRectMake(TOPDIS, LEFTDIS+moveDis, 235*WIDTHRADIUS, 1);
        if (moveDis<=0) {
            ifDown=!ifDown;
        }
    }
}

-(void)createTopView{
    UIView *backview=[UIView new];
    backview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:backview];
    
    UILabel *label=[UILabel labelWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] superView:self.view];
    label.text=@"扫码充电";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *backBtn=[UIButton new];
    [backBtn setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@64);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backview.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
    }];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backview.mas_bottom);
        make.left.equalTo(backview).offset(10);
        make.height.width.equalTo(@44);
    }];
}

-(void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)createButtomView{
    UILabel *topLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium] textClolr:[UIColor whiteColor] superView:self.view];
    topLabel.text=@"充电小贴士";
    topLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:topLabel];
    
    UILabel *contentLabel=[UILabel labelWithFont:[UIFont systemFontOfSize:16 weight:UIFontWeightRegular] textClolr:[UIColor whiteColor] superView:self.view];
    contentLabel.text=@"步骤一：扫描二维码识别充电桩\n步骤二：检查并确认电缆连接\n步骤三：开始充电";
    contentLabel.textAlignment=NSTextAlignmentLeft;
    contentLabel.numberOfLines=0;
    [self.view addSubview:contentLabel];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.centerX.equalTo(self.view);
    }];
    
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(contentLabel.mas_top).offset(-10);
        make.centerX.equalTo(self.view);
    }];
}

- (void)setupCamera
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device==nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"设备没有摄像头" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //设置扫描区域
    ///x 与 y 互换  width 与 height 互换
    [_output setRectOfInterest:CGRectMake(CENTERRECT.origin.y/HEIGHTOFSCREEN, CENTERRECT.origin.x/WIDTHOFSCREEN, CENTERRECT.size.height/HEIGHTOFSCREEN, CENTERRECT.size.width/WIDTHOFSCREEN)];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    [_output setMetadataObjectTypes:[NSArray arrayWithObjects:AVMetadataObjectTypeQRCode, nil]];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame =self.view.layer.bounds;
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    // Start
    [_session startRunning];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        //停止扫描
        [_session stopRunning];
        [timer setFireDate:[NSDate distantFuture]];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        NSLog(@"扫描结果：%@",stringValue);
        
        NSArray *arry = metadataObject.corners;
        for (id temp in arry) {
            NSLog(@"%@",temp);
        }

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描结果" message:stringValue preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (_session != nil && timer != nil) {
                [_session startRunning];
                [timer setFireDate:[NSDate date]];
            }
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        NSLog(@"无扫描信息");
        return;
    }
    
}


@end
