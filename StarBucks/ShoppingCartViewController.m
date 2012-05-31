//
//  ShoppingCartViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController
@synthesize m_tableView = _m_tableView;
@synthesize arrBuied = _arrBuied;
@synthesize arrCommodity = _arrCommodity;
//@synthesize m_Cell = _m_Cell;
@synthesize imageCommodity = _imageCommodity;
@synthesize btDelete = _btDelete;
@synthesize num = _num;
@synthesize total = _total;
@synthesize nameCommodity = _nameCommodity;
@synthesize arrPickerData = _arrPickerData;
@synthesize btHome = _btHome;
@synthesize segmented = _segmented;
@synthesize m_SettleAccountsViewController = _m_SettleAccountsViewController;
//@synthesize textFieldDelegate = _textFieldDelegate;
@synthesize m_serviceGetOrderData = _m_serviceGetOrderData;
@synthesize m_serviceGetOneOrderData = _m_serviceGetOneOrderData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        m_serviceGetOrderData = [[serviceGetOrderData alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
        [m_serviceGetOrderData sendRequestWithData:@"OrderId=" addr:@"GetAllOrderData"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"购物车";
//    arrPickerData = [[NSArray alloc]initWithObjects:@"1", @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
//    self.arrCommodity = [[NSMutableArray alloc]initWithObjects:@"冰调制咖啡",@"冰拿铁",@"密斯朵咖啡" ,@"牛奶",@"芒果西番莲果茶星冰乐",nil];
//    self.arrBuied = [[NSArray alloc]initWithObjects:@"芒果西番莲果茶星冰乐",@"密斯朵咖啡",@"冰调制咖啡", nil];
//    NSLog(@"arrCommodity = %@",self.arrCommodity);
    
//    self.navigationItem.title = @"相册";

    
	NSArray *array = [[NSArray alloc]initWithObjects:@"购物车",@"已购买",nil];	
	self.segmented = [[UISegmentedControl alloc]initWithItems:array];
	self.segmented.segmentedControlStyle = UISegmentedControlStyleBar;
	[self.segmented addTarget:self action:@selector(changeSegmented) forControlEvents:UIControlEventValueChanged];
	self.segmented.selectedSegmentIndex = 0;
	//[self.navigationController.navigationBar addSubview:segmented];
	self.navigationItem.titleView = self.segmented;

    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home"]                                    
//                                    initWithTitle:@"首页"
//                                    style:UIBarButtonItemStyleBordered
//                                    target:self
//                                    action:@selector(homePage)];
//    
//	UINavigationBar *NavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//	UINavigationItem *NavTitle = [[UINavigationItem alloc] initWithTitle:@"Title"];
//	[NavBar pushNavigationItem:NavTitle animated:YES];
//	[self.view addSubview:NavBar];
//	
////	UIButton *btHome = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 250.0, 62.0, 29.0)];
//	[btHome setImage:[UIImage imageNamed:@"BackBtn.png"] forState:UIControlStateNormal];
//	[BackBtn addTarget:self action:@selector(BackAction:) forControlEvents:UIControlEventTouchUpInside];
//	UIBarButtonItem *BackBarBtn = [[UIBarButtonItem alloc] initWithCustomView:BackBtn];
//	NavBar.topItem.leftBarButtonItem = BackBarBtn;	
    
//    self.btHome = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.btHome.frame = CGRectMake(0, 250, 50, 30);
//    [self.btHome setBackgroundImage:[UIImage imageNamed:@"donebutto@2x7"] forState:UIControlStateNormal];
//    [self.btHome addTarget:self action:@selector(homePage) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *homeBarBt = [[UIBarButtonItem alloc]initWithCustomView:self.btHome];
//    [self.navigationItem setRightBarButtonItem:homeBarBt animated:YES];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]    
                                    initWithTitle:@"首页"
                                    style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(homePage)];
    NSArray *arr = [[NSArray alloc]initWithObjects:rightButton, nil];
    
    //    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.navigationItem setRightBarButtonItems:arr animated:YES]; 

    
}

- (void)changeSegmented
{
    if (self.segmented.selectedSegmentIndex == 0) {
        NSLog(@"%i",self.segmented.selectedSegmentIndex);
        self.segmented.selectedSegmentIndex = 0;
        NSLog(@"%i",self.segmented.selectedSegmentIndex);
    }else if(self.segmented.selectedSegmentIndex == 1){
        NSLog(@"%i",self.segmented.selectedSegmentIndex);
        self.segmented.selectedSegmentIndex = 1;
    }
    [self.m_tableView reloadData];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %i!",[indexPath row]);
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSInteger n = 0;
    if (self.segmented.selectedSegmentIndex == 0) {
        n = 3;
    }else if(self.segmented.selectedSegmentIndex == 1){
        Global *global = [Global sharedGlobal];
        if([global.arrOrder count] == 0){
            n = 1;
        }else {
            n = [global.arrOrder count];
        }
    }
    return n;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"row = %i",[indexPath row]);
//    NSLog(@"count = %i",[self.arrCommodity count]);
    Global *global = [Global sharedGlobal];
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (self.segmented.selectedSegmentIndex == 0) {
        if ([indexPath row] == 0) {
            if ([global.dicShopCart count] == 0) {
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 120, 60)];
                label.text = @"购物车内无产品";
                [cell addSubview:label];
            }else {
                imageCommodity = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jtmqd"]];
                imageCommodity.frame = CGRectMake(5, 5, 60, 60);
                [cell addSubview:imageCommodity];
                
                self.nameCommodity = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 200, 20)];
                self.nameCommodity.text = @"星巴克拿铁";
                [cell addSubview:self.nameCommodity];
                
                self.btDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                self.btDelete.frame = CGRectMake(265, 17, 48, 35);
                [self.btDelete setTitle:@"删除" forState:UIControlStateNormal];
                [self.btDelete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
                self.btDelete.tag = [indexPath row];
                [cell addSubview:self.btDelete];
                
                self.num = [[UITextField alloc]initWithFrame:CGRectMake(73, 33, 30, 30)];
                self.num.text = [global.dicShopCart objectForKey:@"Number"];
                self.num.textAlignment = UITextAlignmentCenter;
                self.num.borderStyle = UITextBorderStyleRoundedRect;
                self.num.delegate = self;
                [cell addSubview:self.num];
                
                self.total = [[UILabel alloc]initWithFrame:CGRectMake(163, 44, 70, 21)];
                self.total.text = [global.dicShopCart objectForKey:@"TotalPrice"];
                self.total.textAlignment = UITextAlignmentCenter;
                self.total.font = [UIFont systemFontOfSize:14];
                [cell addSubview:self.total];
                
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(140, 44, 42, 21)];
                label.text = @"小计:";
                label.font = [UIFont systemFontOfSize:11];
                label.textAlignment = UITextAlignmentCenter;
                [cell addSubview:label];
                
                UILabel *shopName = [[UILabel alloc]initWithFrame:CGRectMake(115, 30, 120, 18)];
                shopName.text = [global.dicShopCart objectForKey:@"ShopName"];
                shopName.textAlignment = UITextAlignmentCenter;
                shopName.font = [UIFont systemFontOfSize:11];
                [cell addSubview:shopName];

            }    
        }else if([indexPath row] == 1){
            
            
            
            UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 18, 200, 26)];
            label1.text = [global.dicShopCart objectForKey:@"TotalPrice"];
            [cell addSubview:label1];
            
            
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 18, 50, 26)];
            label2.text = @"总计:";
            [cell addSubview:label2];
            
        }else if([indexPath row] == 2){
            UIButton *btClear = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btClear.frame = CGRectMake(40, 20, 100, 30);
            [btClear setTitle:@"清空购物车" forState:UIControlStateNormal];
            [btClear addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btClear];
            
            UIButton *btPay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btPay.frame = CGRectMake(170, 20, 100, 30);
            [btPay setTitle:@"结算" forState:UIControlStateNormal];
            [btPay addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btPay];
            if ([global.dicShopCart count] == 0) {
                btPay.enabled = NO;
            }else {
                btPay.enabled = YES;
            }
            
        }

    }else if(self.segmented.selectedSegmentIndex == 1){
        
        if ([global.arrOrder count] == 0) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 120, 60)];
            label.text = @"无已购买产品";
            [cell addSubview:label];
        }else {
            NSDictionary *dic = [global.arrOrder objectAtIndex:[indexPath row]];
            imageCommodity = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jtmqd"]];
            imageCommodity.frame = CGRectMake(5, 5, 60, 60);
            [cell addSubview:imageCommodity];
            
            self.nameCommodity = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 200, 20)];
            self.nameCommodity.text = [dic objectForKey:@"ProductName"];
            [cell addSubview:self.nameCommodity];
            
            self.num = [[UITextField alloc]initWithFrame:CGRectMake(73, 33, 30, 30)];
            self.num.text = [dic objectForKey:@"Number"];
            self.num.textAlignment = UITextAlignmentCenter;
            self.num.borderStyle = UITextBorderStyleRoundedRect;
            self.num.delegate = self;
            [cell addSubview:self.num];
            
            self.total = [[UILabel alloc]initWithFrame:CGRectMake(153, 44, 90, 21)];
            self.total.text = [dic objectForKey:@"TotalPrice"];
            self.total.textAlignment = UITextAlignmentCenter;
            self.total.font = [UIFont systemFontOfSize:14];
            [cell addSubview:self.total];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(130, 44, 42, 21)];
            label.text = @"小计:";
            label.font = [UIFont systemFontOfSize:11];
            label.textAlignment = UITextAlignmentCenter;
            [cell addSubview:label];
            
            UILabel *shopName = [[UILabel alloc]initWithFrame:CGRectMake(115, 30, 120, 18)];
            shopName.text = [dic objectForKey:@"ShopName"];
            shopName.textAlignment = UITextAlignmentCenter;
            shopName.font = [UIFont systemFontOfSize:11];
            [cell addSubview:shopName];
            
            UIButton *btBuied = [UIButton buttonWithType:UIButtonTypeCustom];
            btBuied.frame = CGRectMake(255, 22, 55, 25);
            [btBuied setTitle:[dic objectForKey:@"OrderStates"] forState:UIControlStateNormal];
            [btBuied setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btBuied.titleLabel.font = [UIFont systemFontOfSize:17];
            [btBuied addTarget:self action:@selector(pickuped:) forControlEvents:UIControlEventTouchUpInside];
            btBuied.tag = [indexPath row];
            [cell addSubview:btBuied];

        }

    }
        
            
    
    return cell;
    
}

- (void)pickuped:(id)sender
{
    UIButton *bt = sender;
    Global *global = [Global sharedGlobal];
    nuOfOrder = bt.tag;
    NSString *str = [[global.arrOrder objectAtIndex:bt.tag] objectForKey:@"OrderId"];
    m_serviceGetOneOrderData = [[serviceGetOneOrderData alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
    [m_serviceGetOneOrderData sendRequestWithData:[NSString stringWithFormat:@"OrderId=%@",str] addr:@"GetOrderData"];
    NSLog(@"pickuped!");
}

- (void)delete:(id)sender;
{
    Global *global = [Global sharedGlobal];
    [global.dicShopCart removeAllObjects];
    
//    UIButton *bt = sender;
//    [self.arrCommodity removeObjectAtIndex:bt.tag];
    [self.m_tableView reloadData];
}

- (void)clear
{
    Global *global = [Global sharedGlobal];
    [global.dicShopCart removeAllObjects];
    [self.m_tableView reloadData];

    NSLog(@"clear!");
}

- (void)pay
{
    m_SettleAccountsViewController = [[SettleAccountsViewController alloc]initWithNibName:@"SettleAccountsViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:m_SettleAccountsViewController animated:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    NSLog(@"changed!");
    return NO;
}

#pragma mark -
#pragma mark serviceCallBack
- (void)serviceGetOrderDataCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error
{
    Global *global = [Global sharedGlobal];
    if (dicCallBack != nil) {
        NSMutableArray *arr = [dicCallBack objectForKey:@"Orders"];
        [global.arrOrder removeAllObjects];
        for (NSMutableDictionary *dic in arr) {
            [global.arrOrder addObject:dic];
            NSLog(@"%@",global.arrOrder);
        }
    }
    [self.m_tableView reloadData];
}

- (void)serviceGetOneOrderDataCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error
{
    Global *global = [Global sharedGlobal];
    
    if (![[[global.arrOrder objectAtIndex:nuOfOrder] objectForKey:@"OrderStates"] isEqualToString:[dicCallBack objectForKey:@"OrderStates"]]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"是否确认提货?" 
                                                       message:nil 
                                                      delegate:self 
                                             cancelButtonTitle:nil 
                                             otherButtonTitles:@"确认",@"取消", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Global *global = [Global sharedGlobal];
    if (buttonIndex == 0) {
        NSLog(@"确认提货");
        
        [[global.arrOrder objectAtIndex:nuOfOrder] setObject:@"已提货" forKey:@"OrderStates"];
        [self.m_tableView reloadData];
        
    }else if(buttonIndex == 1){
        NSLog(@"取消提货");
    }
}


@end
