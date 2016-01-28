//
//  IQViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "IQViewController.h"
#import "IQAViewController.h"


@interface IQViewController ()
{
    BOOL Ok;
}

- (IBAction)backBtn:(UIButton *)sender;
- (IBAction)serAct:(UIButton *)sender;

- (IBAction)warnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *warnBtn;

@end

@implementation IQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Ok = YES;

//   
//
//
    

    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backBtn:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuListClick" object:nil];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)serAct:(UIButton *)sender {
    IQAViewController *iqa = [[IQAViewController alloc]init];
    [self presentViewController:iqa animated:YES completion:nil];
}

- (IBAction)warnAction:(UIButton *)sender {
      UIButton *warnBtn = self.warnBtn;
    
    if (Ok == NO) {
          [warnBtn setImage:[UIImage imageNamed:@"machine_inventory_lack"] forState:UIControlStateNormal];
        
       
    } if (Ok == YES) {
        [warnBtn setImage:[UIImage imageNamed:@"machine_inventory_enough"] forState:UIControlStateNormal];
       
    }
    Ok = !Ok;
    [self.view addSubview:warnBtn];
}

@end
