//
//  IQAViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/8.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "IQAViewController.h"

@interface IQAViewController ()
- (IBAction)backBtn:(UIButton *)sender;

@end

@implementation IQAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)backBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
