//
//  ForgetPW.m
//  BCP
//
//  Created by Harry on 2017/12/12.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "ForgetPW.h"

@interface ForgetPW ()
{
    UIImage *heighlight ;
    UIImage *normal;
}
@property (weak, nonatomic) IBOutlet UIButton *ConformBtn;
@property (weak, nonatomic) IBOutlet UITextField *OldPW;
@property (weak, nonatomic) IBOutlet UITextField *NewPW;
@property (weak, nonatomic) IBOutlet UIButton *Btn2;
@property (weak, nonatomic) IBOutlet UIButton *Btn1;


@end

@implementation ForgetPW

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    [_ConformBtn.layer setMasksToBounds:YES];
    [_ConformBtn.layer setCornerRadius:25];
    
    normal = [UIImage imageNamed:@"noSeePW"];
    heighlight = [UIImage imageNamed:@"SeePW"];
    
    [_Btn2 addTarget:self action:@selector(Charge) forControlEvents:UIControlEventTouchUpInside];
    
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
//
//   [_ChargeEye setUserInteractionEnabled:YES];
//
//    //tap 手势一共两个属性，一个是设置轻拍次数，一个是设置点击手指个数
//    //设置轻拍次数
//    tap.numberOfTapsRequired = 1;
//    //设置手指字数
//    tap.numberOfTouchesRequired = 1;
//
//    //别忘了添加到testView上
//    [_ChargeEye addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Btn1:(id)sender
{
    _Btn1.selected =! _Btn1.selected;
    if(_Btn1.selected){
        _OldPW.secureTextEntry = NO;
    }else{
        _OldPW.secureTextEntry = YES;
    }
}

-(void)Charge{
    _Btn2.selected =! _Btn2.selected;
    if(_Btn2.selected){
        _NewPW.secureTextEntry = NO;
    }else{
        _NewPW.secureTextEntry = YES;
    }
}
@end
