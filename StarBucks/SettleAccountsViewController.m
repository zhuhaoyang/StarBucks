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
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"信息"
                                                  message:@"支付成功!"
                                                 delegate:self 
                                        cancelButtonTitle:@"确认" 
                                        otherButtonTitles: nil];
    [aler show];

}

@end
