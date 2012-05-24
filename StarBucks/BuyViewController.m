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
@synthesize btBuy = _btBuy;
@synthesize m_ShoppingCartViewController = _m_ShoppingCartViewController;
@synthesize m_GoogleMapViewController = _m_GoogleMapViewController;

@synthesize btIce = _btIce;
@synthesize btMilk = _btMilk;
@synthesize btS = _btS;
@synthesize btM = _btM;
@synthesize btB = _btB;
@synthesize btSB = _btSB;
@synthesize btChooseStore = _btChooseStore;
@synthesize btSelectTime = _btSelectTime;
@synthesize btAdd = _btAdd;
@synthesize btReduction = _btReduction;

@synthesize numOfCoffee = _numOfCoffee;

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

- (IBAction)buy
{
    m_ShoppingCartViewController = [[ShoppingCartViewController alloc]initWithNibName:@"ShoppingCartViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:m_ShoppingCartViewController animated:YES];
}

- (IBAction)shoppingCart
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"信息" 
                                                        message:@"成功加入购物车!" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"确定" 
                                              otherButtonTitles:nil];
    [alertView show];

}

- (IBAction)ice:(id)sender
{
    if (self.btIce.tag == 0) {
        self.btIce.tag = 1;
        [self.btIce setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }else if(self.btIce.tag == 1){
        self.btIce.tag = 0;
        [self.btIce setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
    }
}

- (IBAction)milk:(id)sender
{
    if (self.btMilk.tag == 0) {
        self.btMilk.tag = 1;
        [self.btMilk setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }else if(self.btMilk.tag == 1){
        self.btMilk.tag = 0;
        [self.btMilk setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
    }
}

- (IBAction)SCup:(id)sender
{
    [self.btS setImage:[UIImage imageNamed:@"starbucks_30"] forState:UIControlStateNormal];
    [self.btM setImage:[UIImage imageNamed:@"starbucks_21"] forState:UIControlStateNormal];
    [self.btB setImage:[UIImage imageNamed:@"starbucks_22"] forState:UIControlStateNormal];
    [self.btSB setImage:[UIImage imageNamed:@"starbucks_23"] forState:UIControlStateNormal];

}

- (IBAction)MCup:(id)sender
{
    [self.btS setImage:[UIImage imageNamed:@"starbucks_20"] forState:UIControlStateNormal];
    [self.btM setImage:[UIImage imageNamed:@"starbucks_31"] forState:UIControlStateNormal];
    [self.btB setImage:[UIImage imageNamed:@"starbucks_22"] forState:UIControlStateNormal];
    [self.btSB setImage:[UIImage imageNamed:@"starbucks_23"] forState:UIControlStateNormal];
}

- (IBAction)BCup:(id)sender
{
    [self.btS setImage:[UIImage imageNamed:@"starbucks_20"] forState:UIControlStateNormal];
    [self.btM setImage:[UIImage imageNamed:@"starbucks_21"] forState:UIControlStateNormal];
    [self.btB setImage:[UIImage imageNamed:@"starbucks_32"] forState:UIControlStateNormal];
    [self.btSB setImage:[UIImage imageNamed:@"starbucks_23"] forState:UIControlStateNormal];
}

- (IBAction)SBCup:(id)sender
{
    [self.btS setImage:[UIImage imageNamed:@"starbucks_20"] forState:UIControlStateNormal];
    [self.btM setImage:[UIImage imageNamed:@"starbucks_21"] forState:UIControlStateNormal];
    [self.btB setImage:[UIImage imageNamed:@"starbucks_22"] forState:UIControlStateNormal];
    [self.btSB setImage:[UIImage imageNamed:@"starbucks_33"] forState:UIControlStateNormal];
}

- (IBAction)chooseStore:(id)sender
{
    if (m_GoogleMapViewController == nil) {
        m_GoogleMapViewController = [[GoogleMapViewController alloc]initWithNibName:@"GoogleMapViewController" bundle:[NSBundle mainBundle]];
    }
    [self.navigationController pushViewController:m_GoogleMapViewController animated:YES];
}

- (IBAction)selectTime:(id)sender
{

}

- (IBAction)add:(id)sender
{
    int n = [self.numOfCoffee.text intValue] + 1;
    self.numOfCoffee.text = [NSString stringWithFormat:@"%i",n];
}

- (IBAction)reduction:(id)sender
{
    if ([self.numOfCoffee.text intValue] > 1) {
        int n = [self.numOfCoffee.text intValue] - 1;
        self.numOfCoffee.text = [NSString stringWithFormat:@"%i",n];
    }

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
