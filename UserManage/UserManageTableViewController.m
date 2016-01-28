//
//  UserManageTableViewController.m
//  kyd
//
//  Created by LisonFan on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "UserManageTableViewController.h"
#import "UserManageTableViewCell.h"
#import "AddUserViewController.h"

@interface UserManageTableViewController (){
    NSMutableDictionary * _showDic;
    NSInteger didCell;
    BOOL isDidCell;
}

@end

@implementation UserManageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib * nib = [UINib nibWithNibName:@"UserManageTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"myCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reviseBtnClick) name:@"reviseBtnClick" object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (void)reviseBtnClick{
    AddUserViewController * addUser = [[AddUserViewController alloc] initWithNibName:@"AddUserViewController" bundle:nil];
    [self presentViewController:addUser animated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([_showDic objectForKey:[NSString stringWithFormat:@"%ld",(long)section]]) {
        switch (didCell) {
            case 0:
                return 3;
                break;
            case 1:
                return 4;
                break;
            case 2:
                return 4;
                break;
            default:
                return 4;
                break;
        }
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserManageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    NSArray * wkArray1 = @[@"小周",@"小赵",@"宁采臣"];
    NSArray * wkArray2 = @[@"商家",@"员工",@"代理"];
    NSArray * wowArray1 = @[@"高太后",@"士兵甲",@"士兵乙",@"士兵丙"];
    NSArray * wowArray2 = @[@"商家",@"代理",@"商家",@"代理"];
    NSArray * kedArray1 = @[@"艺术家",@"叫兽",@"攻城师",@"职业玩家"];
    NSArray * kedArray2 = @[@"商家",@"代理",@"员工",@"代理"];
    switch (didCell) {
        case 0:
            cell.label1.text = [NSString stringWithFormat:@"%@",wkArray1[indexPath.row]];
            cell.label2.text = [NSString stringWithFormat:@"%@",wkArray2[indexPath.row]];
        case 1:
            cell.label1.text = [NSString stringWithFormat:@"%@",wowArray1[indexPath.row]];
            cell.label2.text = [NSString stringWithFormat:@"%@",wowArray2[indexPath.row]];
            break;
        case 2:
            cell.label1.text = [NSString stringWithFormat:@"%@",kedArray1[indexPath.row]];
            cell.label2.text = [NSString stringWithFormat:@"%@",kedArray2[indexPath.row]];
            break;
        default:
            break;
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = [[UIView alloc] init];
    header.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"list_bg"]];
    UILabel * myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, 150, 20)];
    NSArray * array = @[@"万科公司（3）",@"沃尔沃（4）",@"可易得（4）"];
    myLabel.text = [NSString stringWithFormat:@"%@",array[section]];
    UIButton * myBtn = [[UIButton alloc] initWithFrame:CGRectMake(330, 0, 30, 50)];
    [myBtn setBackgroundImage:[UIImage imageNamed:@"title_button_2.png"] forState:UIControlStateNormal];
    myBtn.transform = CGAffineTransformRotate(myBtn.transform, - M_PI);
    [header addSubview:myBtn];
    [header addSubview:myLabel];
    header.tag = section;
    UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
    singleRecognizer.numberOfTapsRequired = 1; //点击的次数 =1:单击
    [singleRecognizer setNumberOfTouchesRequired:1];//1个手指操作
    [header addGestureRecognizer:singleRecognizer];//添加一个手势监测；
    return header;
}
-(void)SingleTap:(UITapGestureRecognizer*)recognizer{
    NSInteger didSection = recognizer.view.tag;
    didCell = recognizer.view.tag;
    if (!_showDic) {
        _showDic = [[NSMutableDictionary alloc]init];
    }
    NSString *key = [NSString stringWithFormat:@"%ld",(long)didSection];
    if (![_showDic objectForKey:key]) {
        [_showDic setObject:@"1" forKey:key];
    }else{
        [_showDic removeObjectForKey:key];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:didSection] withRowAnimation:UITableViewRowAnimationFade];
}
- (IBAction)backBtnAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuListClick" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
