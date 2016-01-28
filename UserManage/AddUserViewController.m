//
//  AddUserViewController.m
//  kyd
//
//  Created by LisonFan on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "AddUserViewController.h"

@interface AddUserViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation AddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.backgroundColor = [UIColor blackColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)backBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * _id = @"myCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_id];
    }
    NSArray * array = @[@"可易得",@"万科公司",@"沃尔沃",@"沃尔沃"];
    cell.textLabel.text = array[indexPath.row];
    UIButton * checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.frame = CGRectMake(200, 13, 20, 20);
    checkBox.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:checkBox];
    return cell;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
