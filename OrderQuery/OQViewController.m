//
//  OQViewController.m
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "OQViewController.h"

@interface OQViewController ()

@end

@implementation OQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //1.定义全局tableView
 
    //2.初始化_tableView
   // self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //3.设置代理，头文件也要包含 UITableViewDelegate,UITableViewDataSource
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //4.添加_tableView
    [self.view addSubview:self.tableView];
    
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    
    _sectionArray = [NSArray arrayWithObjects:@"进行中",@"已完成", nil];
    
    _rowArray = [NSArray arrayWithObjects:@"万科公司",@"腾讯公司",@"阿里巴巴集团", nil];
    _rowArray1 = [NSArray arrayWithObjects:@"可易得", nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_rowArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(cell==NULL){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"这"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset=UIEdgeInsetsZero;
        cell.clipsToBounds = YES;
    }
       cell.textLabel.text = [NSString stringWithFormat:@"%@",_rowArray[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_showDic objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]]) {
        return 60;
    }
    return 0;
}
//section头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
//section头部显示的内容
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 50)];
    header.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"list_bg"]];
    
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 20, 300, 20)];
    myLabel.text = [NSString stringWithFormat:@"%@",_sectionArray[section]];
    myLabel.textColor = [UIColor blackColor];
    [header addSubview:myLabel];
    
    
    // 单击的 Recognizer ,收缩分组cell
    header.tag = section;
    
    UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
    singleRecognizer.numberOfTapsRequired = 1; //点击的次数 =1:单击
    [singleRecognizer setNumberOfTouchesRequired:1];//1个手指操作
    [header addGestureRecognizer:singleRecognizer];//添加一个手势监测；
    
    return header;
}

#pragma mark 展开收缩section中cell 手势监听
-(void)SingleTap:(UITapGestureRecognizer*)recognizer{
    NSInteger didSection = recognizer.view.tag;
    
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backBtnAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuListClick" object:nil];

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
