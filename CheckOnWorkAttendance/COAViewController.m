//
//  COAViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "COAViewController.h"

@interface COAViewController ()
- (IBAction)backBtn:(UIButton *)sender;

@end

@implementation COAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)backBtn:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuListClick" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
