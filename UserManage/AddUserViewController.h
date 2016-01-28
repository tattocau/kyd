//
//  AddUserViewController.h
//  kyd
//
//  Created by LisonFan on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)backBtnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *shopsTableView;

@end
