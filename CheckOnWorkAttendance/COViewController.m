//
//  COViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "COViewController.h"
#import "COAViewController.h"
#import "COBViewController.h"
#import "COCViewController.h"
#import "CODViewController.h"

@interface COViewController ()
- (IBAction)backBtn:(UIButton *)sender;
- (IBAction)signBtn:(UIButton *)sender;
- (IBAction)ckData:(UIButton *)sender;
- (IBAction)anBtn:(UIButton *)sender;
- (IBAction)rankBtn:(UIButton *)sender;

@end

@implementation COViewController

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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuListClick" object:nil];

    [self dismissViewControllerAnimated:YES completion:nil];
      
}

- (IBAction)signBtn:(UIButton *)sender {
    COAViewController *coa = [[COAViewController alloc]init];
    [self presentViewController:coa
                       animated:YES completion:nil];
}

- (IBAction)ckData:(UIButton *)sender {
    COBViewController *cob = [[COBViewController alloc]init];
    [self presentViewController:cob animated:YES completion:nil];
    
}

- (IBAction)anBtn:(UIButton *)sender {
    COCViewController *coc = [[COCViewController alloc]init];
    [self presentViewController:coc animated:YES completion:nil];
}

- (IBAction)rankBtn:(UIButton *)sender {
    CODViewController *cod = [[CODViewController alloc]init];
    [self presentViewController:cod animated:YES completion:nil];
}
@end
