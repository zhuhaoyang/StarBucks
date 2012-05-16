//
//  HomePageViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize bt1 = _bt1;
@synthesize bt2 = _bt2;
@synthesize bt3 = _bt3;
@synthesize bt4 = _bt4;
@synthesize bt5 = _bt5;
@synthesize bt6 = _bt6;
@synthesize m_ActivityViewController = _m_ActivityViewController;
//@synthesize m_ShopSearchViewController = _m_ShopSearchViewController;
@synthesize m_DrinkAndFoodViewController = _m_DrinkAndFoodViewController;
@synthesize m_ShoppingCartViewController = _m_ShoppingCartViewController;
@synthesize m_SBClubViewController = _m_SBClubViewControllerl;
@synthesize m_SettingViewController = _m_SettingViewController;
//@synthesize m_GoogleMapViewController = _m_GoogleMapViewController;
@synthesize m_BaiduMapViewController = _m_BaiduMapViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIButton *rightButton1 = [[UIButton alloc]init];
//    rightButton1.titleLabel.text = @"注册";
//    UIButton *rightButton2 = [[UIButton alloc]init];
//    rightButton2.titleLabel.text = @"登录";
    
    UIBarButtonItem *rightButton1 = [[UIBarButtonItem alloc]
                                   initWithTitle:@"登录"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(login)];
    UIBarButtonItem *rightButton2 = [[UIBarButtonItem alloc]    
                                     initWithTitle:@"注册"
                                     style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(login)];
    NSArray *arr = [[NSArray alloc]initWithObjects:rightButton1, rightButton2, nil];

//    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.navigationItem setRightBarButtonItems:arr animated:YES]; 
    // Do any additional setup after loading the view from its nib.
}

- (void)login
{
    NSLog(@"login!");
}

- (IBAction)clickBt1:(id)sender
{

    m_ActivityViewController = [[ActivityViewController alloc]initWithNibName:@"ActivityViewController" bundle:nil];
    [self.navigationController pushViewController:m_ActivityViewController animated:YES];
    
}

- (IBAction)clickBt2:(id)sender
{
    m_BaiduMapViewController = [[BaiduMapViewController alloc]initWithNibName:@"BaiduMapViewController" bundle:nil];
    [self.navigationController pushViewController:m_BaiduMapViewController animated:YES];
}

- (IBAction)clickBt3:(id)sender
{
    m_DrinkAndFoodViewController = [[DrinkAndFoodViewController alloc]initWithNibName:@"DrinkAndFoodViewController" bundle:nil];
    [self.navigationController pushViewController:m_DrinkAndFoodViewController animated:YES];
}

- (IBAction)clickBt4:(id)sender
{
    m_ShoppingCartViewController = [[ShoppingCartViewController alloc]initWithNibName:@"ShoppingCartViewController" bundle:nil];
    [self.navigationController pushViewController:m_ShoppingCartViewController animated:YES];}

- (IBAction)clickBt5:(id)sender
{
    m_SBClubViewController = [[SBClubViewController alloc]initWithNibName:@"SBClubViewController" bundle:nil];
    [self.navigationController pushViewController:m_SBClubViewController animated:YES];}

- (IBAction)clickBt6:(id)sender
{
    m_SettingViewController = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:m_SettingViewController animated:YES];}


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

@end
