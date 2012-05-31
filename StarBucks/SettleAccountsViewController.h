//
//  SettleAccountsViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-17.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "serviceAddOrderData.h"

@interface SettleAccountsViewController : UIViewController
<serviceAddOrderDataCallBackDelegate>{
    UIButton *__weak btConfirmPay;
    UILabel *__weak totalPrice;
    serviceAddOrderData *m_serviceAddORderData;
}

@property(nonatomic,weak) IBOutlet UIButton *btConfirmPay;
@property(nonatomic,weak) IBOutlet UILabel *totalPrice;
@property(nonatomic,strong) serviceAddOrderData *m_serviceAddOrderData;

- (IBAction)confirmPay:(id)sender;

@end
