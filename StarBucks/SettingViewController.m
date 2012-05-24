//
//  SettingViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize btTest = btTest;
@synthesize m_serviceTest = _m_serviceTest;
- (IBAction)test:(id)sender
{
    self.m_serviceTest = [[serviceTest alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"2",@"OrderId", nil];
    [self.m_serviceTest sendRequestWithData:dic addr:@"GetOrderData"];
    
//    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"123",@"ProductId",@"222",@"UserName",@"333",@"ShopName" ,@"4",@"Number",@"555",@"TotalPrice",@"2012/5/22",@"CreatTime",@"7",@"OrderStates",nil];
//    [self.m_serviceTest sendRequestWithData:dic addr:@"AddOrderData"];
}

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
    self.title = @"个人设置";
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
#pragma mark -
#pragma mark serviceCallBack

-(void)serviceCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error
{
    NSLog(@"%@",dicCallBack);
}

@end
