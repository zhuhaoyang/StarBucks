//
//  DrinkAndFoodViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuyViewController.h"

@interface DrinkAndFoodViewController : UIViewController<
UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>{
    UITableView *__weak m_tableView;
    UISegmentedControl *__weak segment;
    UISearchBar *__weak searchBar;
    NSDictionary *dicEspresso;
    NSDictionary *dicFrappuccinos;
    NSDictionary *dicCoffeeAndTea;
    NSDictionary *dicDessert;
    NSDictionary *dicDrinkAndFood;
    NSMutableDictionary *dicCopy;
//    DeepMutableCopy *deepMutableCopy;
    BuyViewController *m_BuyViewController;
}

@property(nonatomic,weak) IBOutlet UITableView *m_tableView;
@property(nonatomic,weak) IBOutlet UISegmentedControl *segment;
@property(nonatomic,weak) IBOutlet UISearchBar *searchBar;
@property(nonatomic,strong) NSMutableDictionary *dicCopy;
@property(nonatomic,strong) NSDictionary *dicDrinkAndFood;
@property(nonatomic,strong) BuyViewController *m_BuyViewController;
//- (NSMutableDictionary *)mutableDeepCopy:(NSDictionary *)dic;

@end
