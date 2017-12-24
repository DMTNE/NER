//
//  RegisterViewController.m
//  BCP
//
//  Created by Harry on 2017/10/30.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *PNText;
@property (weak, nonatomic) IBOutlet UITextField *YZMText;
@property (weak, nonatomic) IBOutlet UITextField *PWText;
@property (weak, nonatomic) IBOutlet UIButton *ReBtn;
@property (weak, nonatomic) IBOutlet UIButton *Btn1;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";
    [_ReBtn.layer setMasksToBounds:YES];
    [_ReBtn.layer setCornerRadius:25];
    [_Btn1 addTarget:self action:@selector(Charge) forControlEvents:UIControlEventTouchUpInside];
//    UINavigationItem *leftbtn = [[UINavigationItem alloc] initWithTitle:@"返回"];
//    self.navigationItem.leftBarButtonItems = leftbtn;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_PNText resignFirstResponder];
    [_PWText resignFirstResponder];
    [_YZMText resignFirstResponder];
}

//隐藏导航栏横线
//- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
//    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
//        return (UIImageView *)view;
//    }
//    for (UIView *subview in view.subviews) {
//        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
//        if (imageView) {
//            return imageView;
//        }
//    }
//    return nil;
//}

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
-(void)Charge
{
    _Btn1.selected =! _Btn1.selected;
    if(_Btn1.selected){
        _PWText.secureTextEntry = NO;
    }else{
        _PWText.secureTextEntry = YES;
    }
}
         


@end
