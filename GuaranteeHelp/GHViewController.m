//
//  GHViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "GHViewController.h"

@interface GHViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

- (IBAction)backBtn:(UIButton *)sender;
- (IBAction)textBtn:(UIButton *)sender;

@end

@implementation GHViewController

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

- (IBAction)textBtn:(UIButton *)sender {

    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"message" message:@"保修帮助" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * alert = [UIAlertAction actionWithTitle:@"问题一" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label1.text = @"问题一";
        self.label2.text = @"问题一的解释";
        
        
        }];
    UIAlertAction * alert1 = [UIAlertAction actionWithTitle:@"问题二" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label1.text = @"问题二";
        self.label2.text = @"问题二的解释";
        
        
    }];
 
    
    
    [alertCon addAction:alert];
    [alertCon addAction:alert1];
    [self presentViewController:alertCon animated:YES completion:nil];

   
    
    
    
}

@end
