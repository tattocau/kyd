//
//  HAViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "HAViewController.h"

@interface HAViewController ()
- (IBAction)backBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *save;

@end

@implementation HAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor yellowColor]];
    UIButton *save = self.save;
    
    [save setImage:[UIImage imageNamed:@"save_pressed"] forState:UIControlStateHighlighted];
    [save setImage:[UIImage imageNamed:@"save_normal"] forState:UIControlStateNormal];
    [self.view addSubview:save];
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
