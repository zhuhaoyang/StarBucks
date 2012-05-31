//
//  BuyViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-11.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCartViewController.h"
#import "GoogleMapViewController.h"
#import "Global.h"

@interface BuyViewController : UIViewController
<UIScrollViewDelegate,serviceGetOrderDataCallBackDelegate>{
    UIScrollView *__weak m_ScrollView;
    UIButton *__weak btShoppingCart;
    ShoppingCartViewController *m_ShoppingCartViewController;
    GoogleMapViewController *m_GoogleMapViewController;
}

@property(nonatomic,weak) IBOutlet UIScrollView *m_ScrollView;
@property(nonatomic,weak) IBOutlet UIButton *btShoppingCart;
@property(nonatomic,weak) IBOutlet UIButton *btBuy;
@property(nonatomic,strong) ShoppingCartViewController *m_ShoppingCartViewController;
@property(nonatomic,strong) GoogleMapViewController *m_GoogleMapViewController;
@property(nonatomic,weak) IBOutlet UIButton *btIce;
@property(nonatomic,weak) IBOutlet UIButton *btMilk;
@property(nonatomic,weak) IBOutlet UIButton *btS;
@property(nonatomic,weak) IBOutlet UIButton *btM;
@property(nonatomic,weak) IBOutlet UIButton *btB;
@property(nonatomic,weak) IBOutlet UIButton *btSB;
@property(nonatomic,weak) IBOutlet UIButton *btChooseStore;
@property(nonatomic,weak) IBOutlet UIButton *btSelectTime;
@property(nonatomic,weak) IBOutlet UIButton *btAdd;
@property(nonatomic,weak) IBOutlet UIButton *btReduction;

@property(nonatomic,weak) IBOutlet UITextField *numOfCoffee;


- (IBAction)shoppingCart;
- (IBAction)buy;

- (IBAction)ice:(id)sender;
- (IBAction)milk:(id)sender;
- (IBAction)SCup:(id)sender;
- (IBAction)MCup:(id)sender;
- (IBAction)BCup:(id)sender;
- (IBAction)SBCup:(id)sender;
- (IBAction)chooseStore:(id)sender;
- (IBAction)selectTime:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)reduction:(id)sender;


@end
