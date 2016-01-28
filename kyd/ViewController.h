//
//  ViewController.h
//  kyd
//
//  Created by LisonFan on 16/1/4.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)LoginBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountTextFiield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

