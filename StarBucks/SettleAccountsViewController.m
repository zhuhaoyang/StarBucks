//
//  SettleAccountsViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-17.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "SettleAccountsViewController.h"

@interface SettleAccountsViewController ()

@end

@implementation SettleAccountsViewController
@synthesize btConfirmPay = _btConfirmPay;
@synthesize totalPrice = _totalPrice;
@synthesize m_serviceAddOrderData = _m_serviceAddOrderData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Global * global = [Global sharedGlobal];
//    NSLog(@"%@",[global.dicShopCart objectForKey:@"TotalPric"]);
    self.totalPrice.text = [global.dicShopCart objectForKey:@"TotalPrice"];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)confirmPay:(id)sender
{
    
    Global *global = [Global sharedGlobal];
    NSString *str = [NSString stringWithFormat:@"ProductName=%@&UserName=%@&ShopName=%@&Number=%@&Price=%@&TotalPrice=%@&CreateTime=%@&OrderStates=%@",
                     [global.dicShopCart objectForKey:@"ProductName"],
                     [global.dicShopCart objectForKey:@"UserName"],
                     [global.dicShopCart objectForKey:@"ShopName"],
                     [global.dicShopCart objectForKey:@"Number"],
                     [global.dicShopCart objectForKey:@"Price"],
                     [global.dicShopCart objectForKey:@"TotalPrice"],
                     [global.dicShopCart objectForKey:@"CreateTime"],
                     [global.dicShopCart objectForKey:@"OrderStates"]];
    self.m_serviceAddOrderData = [[serviceAddOrderData alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
    [self.m_serviceAddOrderData sendRequestWithData:str addr:@"AddOrderData"];

}


#pragma mark -
#pragma mark serviceCallBack

-(void)serviceAddOrderDataCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error
{
    NSLog(@"%@",dicCallBack);
    if ([[dicCallBack objectForKey:@"boolean"] isEqualToString:@"true"]) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"信息"
                                                      message:@"支付成功!"
                                                     delegate:self 
                                            cancelButtonTitle:@"确认" 
                                            otherButtonTitles: nil];
        [aler show];
        Global *global = [Global sharedGlobal];
        [global.dicShopCart removeAllObjects];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


@end
