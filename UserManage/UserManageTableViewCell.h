//
//  UserManageTableViewCell.h
//  kyd
//
//  Created by LisonFan on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserManageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
- (IBAction)stopBtnAction:(UIButton *)sender;
- (IBAction)reviseBtnAction:(UIButton *)sender;

@property (nonatomic,assign) BOOL isStopBtnClick;

@end
