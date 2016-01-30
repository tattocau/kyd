//
//  ViewController.m
//  kyd
//
//  Created by LisonFan on 16/1/4.
//  Copyright © 2016年 LisonFan. All rights reserved.
//  github

#import "ViewController.h"


@interface ViewController (){
    BOOL isLogin; // 接收登录返回的值 TRUE/FALSE
    BOOL isRePR;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [self setLoginBtn];
    // 注册通知监听器，监听键盘弹起事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 注册通知监听器，监听键盘收起事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 键盘弹出式激发该方法
- (void)keyboardWillShow:(NSNotification *)notification{
    CGRect rect = self.view.frame;
    rect.origin.y = -150;
    self.view.frame = rect;
}
// 键盘关闭时激发该方法
- (void)keyboardWillHide:(NSNotification *)notification{
    CGRect rect = self.view.frame;
    rect.origin.y = 0;
    self.view.frame = rect;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES]; // 点击屏幕空白处收起键盘
}
- (IBAction)LoginBtn:(UIButton *)sender {
    isLogin = TRUE;
//    if ([_accountTextFiield.text isEqualToString:@""]) {
//        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"请检查账号密码" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil];
//        [alert addAction:okAction];
//        [self presentViewController:alert animated:YES completion:nil];
//    }else{
//        isLogin = TRUE;
//    }
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"register"]) {
        return YES;
    }
    if ([identifier isEqualToString:@"login"]) {
        if (isLogin) {
            return YES;
        }else{
            return NO;
        }
    }
    if ([identifier isEqualToString:@"pasrec"]) {
        return YES;
    }
    return NO;
}
- (void)setLoginBtn{
    UIImage * LoginBtnNormalImg = [UIImage imageNamed:@"enter.png"];
    UIImage * LoginBtnStateHighlightedImg = [UIImage imageNamed:@"enterf.png"];
    [self.LoginBtn setBackgroundImage:LoginBtnNormalImg forState:UIControlStateNormal];
    [self.LoginBtn setBackgroundImage:LoginBtnStateHighlightedImg forState:UIControlStateHighlighted];
}
@end
