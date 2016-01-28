//
//  LoctionTableViewController.m
//  kyd
//
//  Created by LisonFan on 16/1/6.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "LoctionTableViewController.h"

@interface LoctionTableViewController ()<UISearchBarDelegate>{
    NSDictionary * cityDic;
    NSArray * keys;
    NSMutableArray * cityArray;
    NSMutableArray * searchResult;
}

@end

@implementation LoctionTableViewController

- (void)viewDidLoad {
    [self loadCityData];
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]]]; // 设置 NavigationBar 背景颜色
    // 设置 NavigationBar title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadCityData{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"citydict" ofType:@"plist"]; // 找到 citydict.plist 文件地址
    cityDic = [NSDictionary dictionaryWithContentsOfFile:path];
    keys = [[cityDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    cityArray = [NSMutableArray array];
    searchResult = [NSMutableArray array];
    
    // 将 cityDic 所有的值循环出来添加到 cityArray
    for (int i = 0; i<cityDic.count; i++) {
        NSArray *array = [NSArray arrayWithArray:cityDic[keys[i]]];
        for (int j=0; j<array.count; j++) {
            [cityArray addObject:array[j]];
        }
    }
}
// 设置分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (searchResult.count == 0) {
        NSString * str = [NSString stringWithFormat:@"%@",keys[section]];
        return str;
    }else{
        return @"搜索结果：";
    }
    return nil;
}

// 设置分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (searchResult.count == 0) {
        return cityDic.count;
    }else{
        return 1;
    }
    return 0;
}

// 设置每个分组内有多少个单元格
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (searchResult.count == 0) {
        NSString * key = [keys objectAtIndex:section];
        NSArray * citySection = [cityDic objectForKey:key];
        return citySection.count;
    }else{
        return searchResult.count;
    }
    return 0;
}

// 设置单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSString *key = [keys objectAtIndex:indexPath.section];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    if (searchResult.count == 0) {
        cell.textLabel.text = [[cityDic objectForKey:key] objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = searchResult[indexPath.row];
    }
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (_loctionSearchBar.text == 0) {
        [_loctionTableView reloadData];
    }else{
        [searchResult removeAllObjects];
        for(NSString * str in cityArray){
            if ([str rangeOfString:searchText options:NSCaseInsensitiveSearch].length > 0) {
                [searchResult addObject:str];
            }
        }
        [_loctionTableView reloadData];
    }
}

- (IBAction)backBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
