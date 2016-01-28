//
//  LoctionTableViewController.h
//  kyd
//
//  Created by LisonFan on 16/1/6.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoctionTableViewController : UITableViewController
- (IBAction)backBtnAction:(UIButton *)sender;
- (IBAction)cancelBtnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *loctionSearchBar;
@property (strong, nonatomic) IBOutlet UITableView *loctionTableView;

@end
