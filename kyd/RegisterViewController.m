//
//  RegisterViewController.m
//  kyd
//
//  Created by LisonFan on 16/1/5.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [self setBackImg];
    [self setRegisterBtnImg];
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
    rect.origin.y = -120;
    self.view.frame = rect;
}
// 键盘关闭时激发该方法
- (void)keyboardWillHide:(NSNotification *)notification{
    CGRect rect = self.view.frame;
    rect.origin.y = 0;
    self.view.frame = rect;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)setBackImg{
    UIImage * backImg = [UIImage imageNamed:@"return2.png"];
    [_back setBackgroundImage:backImg forState:UIControlStateHighlighted];
}
- (void)setRegisterBtnImg{
    UIImage * registerBtnImg = [UIImage imageNamed:@"zhuce2.png"];
    [_registerBtn setBackgroundImage:registerBtnImg forState:UIControlStateHighlighted];
}
@end
