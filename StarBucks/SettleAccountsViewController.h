//
//  SettleAccountsViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-17.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettleAccountsViewController : UIViewController
{
    UIButton *__weak btConfirmPay;
}

@property(nonatomic,weak) IBOutlet UIButton *btConfirmPay;

- (IBAction)confirmPay:(id)sender;

@end
