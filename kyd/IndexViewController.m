//
//  IndexViewController.m
//  kyd
//
//  Created by LisonFan on 16/1/4.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import "IndexViewController.h"
#import "COViewController.h"
#import "HAViewController.h"
#import "IQViewController.h"
#import "OPViewController.h"
#import "OQViewController.h"
#import "GHViewController.h"

@interface IndexViewController (){
    BOOL isMenuBtnClick;
}

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topTitle.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    _bottomLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bottom.png"]];
    [self setLoctionBtnImg];
    [self setMenuBtnImg];
    [self setMenuListBtnImg];
    
    [self.mapScrollView setContentSize:CGSizeMake(self.view.frame.size.width + 140, self.view.frame.size.height)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mapViewTransformTrue) name:@"menuListClick" object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setMenuBtnImg{
    UIImage * menuBtnNormalImg = [UIImage imageNamed:@"menu.png"];
    UIImage * menuBtnStateHighlighted = [UIImage imageNamed:@"menu2.png"];
    [_menuBtn setBackgroundImage:menuBtnNormalImg forState:UIControlStateNormal];
    [_menuBtn setBackgroundImage:menuBtnStateHighlighted forState:UIControlStateHighlighted];
}
- (void)setLoctionBtnImg{
    UIImage * loctionBtnNormalImg = [UIImage imageNamed:@"loction1.png"];
    UIImage * loctionBtnStateHighlighted = [UIImage imageNamed:@"loction2.png"];
    [_loctionBtn setBackgroundImage:loctionBtnNormalImg forState:UIControlStateNormal];
    [_loctionBtn setBackgroundImage:loctionBtnStateHighlighted forState:UIControlStateHighlighted];
}
- (void)setMenuListBtnImg{
    for (int i = 1; i <= 12; i++) {
        UIButton * btn = [self.view viewWithTag:i];
        UIImage * img = [UIImage imageNamed:@"menu_bg2.png"];
        [btn setBackgroundImage:img forState:UIControlStateHighlighted];
    }
}

- (IBAction)menuBtn:(UIButton *)sender {
    if (!isMenuBtnClick) {
        [self mapViewTransformTrue];
        isMenuBtnClick = TRUE;
    }else{
        [self mapViewTransformFalse];
        isMenuBtnClick = FALSE;
    }
}
- (void)mapViewTransformTrue{
    [UIView animateWithDuration:0.5 animations:^{
        [self.mapScrollView setContentOffset:CGPointMake(-140, 0)];
    }];
}
- (void)mapViewTransformFalse{
    [UIView animateWithDuration:0.5 animations:^{
        [self.mapScrollView setContentOffset:CGPointMake(0, 0)];
    }];
}
- (IBAction)COWABtnAction:(UIButton *)sender {
    COViewController * COV = [[COViewController alloc] initWithNibName:@"COViewController" bundle:nil];
    [self presentViewController:COV animated:YES completion:nil];
}

- (IBAction)HABtnAction:(UIButton *)sender {
    HAViewController * HAVC = [[HAViewController alloc] initWithNibName:@"HAViewController" bundle:nil];
    [self presentViewController:HAVC animated:YES completion:nil];
}

- (IBAction)IQBtnAction:(UIButton *)sender {
    IQViewController * IQVC = [[IQViewController alloc] init];
    [self presentViewController:IQVC animated:YES completion:nil];
}
- (IBAction)OPBtnAction:(UIButton *)sender {
    OPViewController * opView = [[OPViewController alloc] initWithNibName:@"OPViewController" bundle:nil];
    [self presentViewController:opView animated:YES completion:nil];
}

- (IBAction)OQBtnAction:(UIButton *)sender {
    OQViewController * oqView = [[OQViewController alloc] initWithNibName:@"OQViewController" bundle:nil];
    [self presentViewController:oqView animated:YES completion:nil];
}

- (IBAction)GHBtnAction:(UIButton *)sender {
    GHViewController * ghView = [[GHViewController alloc] initWithNibName:@"GHViewController" bundle:nil];
    [self presentViewController:ghView animated:YES completion:nil];
}
@end
