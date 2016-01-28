//
//  OQViewController.h
//  kyd
//
//  Created by 李自轩 on 16/1/7.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OQViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_rowArray;
    NSArray *_sectionArray;
    NSArray *_rowArray1;
    
    NSMutableDictionary *_showDic;//用来判断分组展开与收缩的
}

- (IBAction)backBtnAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
