//
//  HomePageViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//
//  文档
#import <UIKit/UIKit.h>
#import "ActivityViewController.h"
//#import "ShopSearchViewController.h"
#import "DrinkAndFoodViewController.h"
#import "ShoppingCartViewController.h"
#import "SBClubViewController.h"
#import "SettingViewController.h"
#import "GoogleMapViewController.h"
//#import "BaiduMapViewController.h"
#import "BMapKit.h"

@interface HomePageViewController : UIViewController{
    UIButton * __weak bt1;
    UIButton * __weak bt2;
    UIButton * __weak bt3;
    UIButton * __weak bt4;
    UIButton * __weak bt5;
    UIButton * __weak bt6;
    ActivityViewController *m_ActivityViewController;
//    ShopSearchViewController *m_ShopSearchViewController;
    DrinkAndFoodViewController *m_DrinkAndFoodViewController;
    ShoppingCartViewController *m_ShoppingCartViewController;
    SBClubViewController *m_SBClubViewController;
    SettingViewController *m_SettingViewController;
    GoogleMapViewController *m_GoogleMapViewController;
//    BaiduMapViewController *m_BaiduMapViewController;
}

@property(nonatomic,weak) IBOutlet UIButton *bt1;
@property(nonatomic,weak) IBOutlet UIButton *bt2;
@property(nonatomic,weak) IBOutlet UIButton *bt3;
@property(nonatomic,weak) IBOutlet UIButton *bt4;
@property(nonatomic,weak) IBOutlet UIButton *bt5;
@property(nonatomic,weak) IBOutlet UIButton *bt6;
@property(nonatomic,strong) ActivityViewController *m_ActivityViewController;
//@property(nonatomic,strong) ShopSearchViewController *m_ShopSearchViewController;
@property(nonatomic,strong) DrinkAndFoodViewController *m_DrinkAndFoodViewController;
@property(nonatomic,strong) ShoppingCartViewController *m_ShoppingCartViewController;
@property(nonatomic,strong) SBClubViewController *m_SBClubViewController;
@property(nonatomic,strong) SettingViewController *m_SettingViewController;
@property(nonatomic,strong) GoogleMapViewController *m_GoogleMapViewController;
//@property(nonatomic,strong) BaiduMapViewController *m_BaiduMapViewController;
- (IBAction)clickBt1:(id)sender;
- (IBAction)clickBt2:(id)sender;
- (IBAction)clickBt3:(id)sender;
- (IBAction)clickBt4:(id)sender;
- (IBAction)clickBt5:(id)sender;
- (IBAction)clickBt6:(id)sender;

@end
