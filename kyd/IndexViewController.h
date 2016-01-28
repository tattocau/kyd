//
//  IndexViewController.h
//  kyd
//
//  Created by LisonFan on 16/1/4.
//  Copyright © 2016年 LisonFan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface IndexViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *topTitle;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIButton *loctionBtn;
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
- (IBAction)menuBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet MKMapView *indexMap;
@property (weak, nonatomic) IBOutlet UILabel *loctionLabel;
@property (weak, nonatomic) IBOutlet UIView *mapView;
- (IBAction)COWABtnAction:(UIButton *)sender;
- (IBAction)HABtnAction:(UIButton *)sender;
- (IBAction)IQBtnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *mapScrollView;
- (IBAction)OPBtnAction:(UIButton *)sender;
- (IBAction)OQBtnAction:(UIButton *)sender;
- (IBAction)GHBtnAction:(UIButton *)sender;

@end
