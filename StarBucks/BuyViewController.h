//
//  BuyViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-11.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCartViewController.h"

@interface BuyViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *__weak m_ScrollView;
    UIButton *__weak btShoppingCart;
    ShoppingCartViewController *m_ShoppingCartViewController;
}

@property(nonatomic,weak) IBOutlet UIScrollView *m_ScrollView;
@property(nonatomic,weak) IBOutlet UIButton *btShoppingCart;
@property(nonatomic,strong) ShoppingCartViewController *m_ShoppingCartViewController;

- (IBAction)shoppingCart;
@end
