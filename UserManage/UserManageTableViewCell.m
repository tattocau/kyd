//
//  UserManageTableViewCell.m
//  kyd
//
//  Created by LisonFan on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "UserManageTableViewCell.h"

@implementation UserManageTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)stopBtnAction:(UIButton *)sender {
    if (!_isStopBtnClick) {
        [sender setBackgroundImage:[UIImage imageNamed:@"start_using_normal"] forState:UIControlStateNormal];
        _isStopBtnClick = TRUE;
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"stop_using_normal"] forState:UIControlStateNormal];
        _isStopBtnClick = FALSE;
    }
}

- (IBAction)reviseBtnAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reviseBtnClick" object:nil];
}
@end
