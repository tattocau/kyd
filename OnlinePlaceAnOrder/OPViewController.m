//
//  OPViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "OPViewController.h"

@interface OPViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)shopBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *shop;

@end

@implementation OPViewController

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
- (IBAction)shopBtn:(UIButton *)sender {
    UIAlertController *actCon = [UIAlertController alertControllerWithTitle:nil message:@"请选择商品" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *aleAct = [UIAlertAction actionWithTitle:@"咖啡" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.shop.text = @"咖啡";
    }];
    
    
    UIAlertAction *alerAct1 = [UIAlertAction actionWithTitle:@"糖果" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.shop.text = @"糖果";
    }];
    
    [actCon addAction:aleAct];
    [actCon addAction:alerAct1];
    
    [self presentViewController:actCon animated:YES completion:nil];
    
    
    
}
@end
