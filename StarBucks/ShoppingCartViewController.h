//
//  ShoppingCartViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CellForShoppingCartViewController.h"
#import "SettleAccountsViewController.h"
#import "Global.h"
#import "serviceGetOrderData.h"
#import "serviceGetOneOrderData.h"

@interface ShoppingCartViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    UITableView *__weak m_tableView;
    NSMutableArray *arrCommodity;
    NSArray *arrBuied;
//    CellForShoppingCartViewController *m_Cell;
    UIButton *btDelete;
    UIImageView *imageCommodity;
    UITextField *num;
    UILabel *total;
    UILabel *nameCommodity;
    NSArray *arrPickerData;
    UIButton *btHome;
    UISegmentedControl *segmented;
    
    SettleAccountsViewController *m_SettleAccountsViewController;
    serviceGetOrderData *m_serviceGetOrderData;
    serviceGetOneOrderData *m_serviceGetOneOrderData;
//    id  <UITextFieldDelegate> __weak textFieldDelegate;
    NSInteger nuOfOrder;

}
@property(nonatomic,weak) IBOutlet UITableView *m_tableView;
@property(nonatomic,strong) NSMutableArray *arrCommodity;
@property(nonatomic,strong) NSArray *arrBuied;
//@property(nonatomic,strong) CellForShoppingCartViewController *m_Cell;
@property(nonatomic,strong) UIImageView *imageCommodity;
@property(nonatomic,strong) UIButton *btDelete;
@property(nonatomic,strong) UITextField *num;
@property(nonatomic,strong) UILabel *total;
@property(nonatomic,strong) UILabel *nameCommodity;
@property(nonatomic,strong) NSArray *arrPickerData;
@property(nonatomic,strong) UIButton *btHome;
@property(nonatomic,strong) UISegmentedControl *segmented;
@property(nonatomic,strong) SettleAccountsViewController *m_SettleAccountsViewController;
//@property(nonatomic,weak) id <UITextFieldDelegate> textFieldDelegate;
@property(nonatomic,strong) serviceGetOrderData *m_serviceGetOrderData;
@property(nonatomic,strong) serviceGetOneOrderData *m_serviceGetOneOrderData;
@end
