//
//  BuyViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-11.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "BuyViewController.h"

@interface BuyViewController ()

@end

@implementation BuyViewController
@synthesize m_ScrollView = _m_ScrollView;
@synthesize btShoppingCart = _btShoppingCart;
@synthesize m_ShoppingCartViewController = _m_ShoppingCartViewController;

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
    //        m_ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
//    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img.jpg"]];
//    [self.m_ScrollView addSubview:image];
    self.m_ScrollView.contentSize = CGSizeMake(320, 600);
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]    
                                     initWithTitle:@"首页"
                                     style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(homePage)];
    NSArray *arr = [[NSArray alloc]initWithObjects:rightButton, nil];
    
    //    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.navigationItem setRightBarButtonItems:arr animated:YES]; 
    //        [self.view addSubview:m_ScrollView];

}

- (void)homePage
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)shoppingCart
{
    m_ShoppingCartViewController = [[ShoppingCartViewController alloc]initWithNibName:@"ShoppingCartViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:m_ShoppingCartViewController animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
