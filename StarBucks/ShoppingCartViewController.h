//
//  ShoppingCartViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CellForShoppingCartViewController.h"

@interface ShoppingCartViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    UITableView *__weak m_tableView;
    NSMutableArray *arrCommodity;
//    CellForShoppingCartViewController *m_Cell;
    UIButton *btDelete;
    UIImageView *imageCommodity;
    UITextField *num;
    UILabel *total;
    UILabel *nameCommodity;
    NSArray *arrPickerData;
    UIButton *btHome;
//    id  <UITextFieldDelegate> __weak textFieldDelegate;

}
@property(nonatomic,weak) IBOutlet UITableView *m_tableView;
@property(nonatomic,strong) NSMutableArray *arrCommodity;
//@property(nonatomic,strong) CellForShoppingCartViewController *m_Cell;
@property(nonatomic,strong) UIImageView *imageCommodity;
@property(nonatomic,strong) UIButton *btDelete;
@property(nonatomic,strong) UITextField *num;
@property(nonatomic,strong) UILabel *total;
@property(nonatomic,strong) UILabel *nameCommodity;
@property(nonatomic,strong) NSArray *arrPickerData;
@property(nonatomic,strong) UIButton *btHome;
//@property(nonatomic,weak) id <UITextFieldDelegate> textFieldDelegate;

@end
