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
    self.title = @"购物车";
    arrPickerData = [[NSArray alloc]initWithObjects:@"1", @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    self.arrCommodity = [[NSMutableArray alloc]initWithObjects:@"冰调制咖啡",@"冰拿铁",@"密斯朵咖啡" ,@"牛奶",@"芒果西番莲果茶星冰乐",nil];
    self.arrBuied = [[NSArray alloc]initWithObjects:@"芒果西番莲果茶星冰乐",@"密斯朵咖啡",@"冰调制咖啡", nil];
    NSLog(@"arrCommodity = %@",self.arrCommodity);
    
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
        n = [self.arrCommodity count] + 2;
    }else if(self.segmented.selectedSegmentIndex == 1){
        n = [self.arrBuied count];
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
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (self.segmented.selectedSegmentIndex == 0) {
        if ([indexPath row] < [self.arrCommodity count]) {
            imageCommodity = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.arrCommodity objectAtIndex:[indexPath row]]]];
            imageCommodity.frame = CGRectMake(5, 5, 60, 60);
            [cell addSubview:imageCommodity];
            
            self.btDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            self.btDelete.frame = CGRectMake(265, 17, 48, 35);
            [self.btDelete setTitle:@"删除" forState:UIControlStateNormal];
            [self.btDelete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
            self.btDelete.tag = [indexPath row];
            [cell addSubview:self.btDelete];
            
            self.num = [[UITextField alloc]initWithFrame:CGRectMake(73, 33, 30, 30)];
            self.num.text = @"1";
            self.num.textAlignment = UITextAlignmentCenter;
            self.num.borderStyle = UITextBorderStyleRoundedRect;
            self.num.delegate = self;
            [cell addSubview:self.num];
            
            self.total = [[UILabel alloc]initWithFrame:CGRectMake(138, 38, 70, 21)];
            self.total.text = @"10.00";
            self.total.textAlignment = UITextAlignmentCenter;
            self.total.font = [UIFont systemFontOfSize:14];
            [cell addSubview:self.total];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(115, 38, 42, 21)];
            label.text = @"小计:";
            label.font = [UIFont systemFontOfSize:11];
            label.textAlignment = UITextAlignmentCenter;
            [cell addSubview:label];
            
            self.nameCommodity = [[UILabel alloc]initWithFrame:CGRectMake(80, 4, 182, 21)];
            self.nameCommodity.text = [self.arrCommodity objectAtIndex:[indexPath row]];
            //        self.nameCommodity.textAlignment = UITextAlignmentCenter;
            //        self.nameCommodity.font = [UIFont systemFontOfSize:14];
            [cell addSubview:self.nameCommodity];
            
            
            
            
        }else if([indexPath row] == [self.arrCommodity count]){
            
            
            
            UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 18, 200, 26)];
            label1.text = @"50.00";
            [cell addSubview:label1];
            
            
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 18, 50, 26)];
            label2.text = @"总计:";
            [cell addSubview:label2];
            
        }else if([indexPath row] == [self.arrCommodity count] + 1){
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
            
        }

    }else if(self.segmented.selectedSegmentIndex == 1){
        imageCommodity = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.arrBuied objectAtIndex:[indexPath row]]]];
        imageCommodity.frame = CGRectMake(5, 5, 60, 60);
        [cell addSubview:imageCommodity];
        
        self.nameCommodity = [[UILabel alloc]initWithFrame:CGRectMake(80, 4, 182, 21)];
        self.nameCommodity.text = [self.arrBuied objectAtIndex:[indexPath row]];
        [cell addSubview:self.nameCommodity];

        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 38, 42, 21)];
        label.text = @"价格:";
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = UITextAlignmentCenter;
        [cell addSubview:label];
        
        self.total = [[UILabel alloc]initWithFrame:CGRectMake(138, 38, 70, 21)];
        self.total.text = @"10.00";
        self.total.textAlignment = UITextAlignmentCenter;
        self.total.font = [UIFont systemFontOfSize:14];
        [cell addSubview:self.total];
        
        UILabel *buied = [[UILabel alloc]initWithFrame:CGRectMake(255, 27, 55, 25)];
        buied.text = @"已提货";
        buied.font = [UIFont systemFontOfSize:17];
        [cell addSubview:buied];
    }
    
    
    return cell;
    
}

- (void)delete:(id)sender;
{
    UIButton *bt = sender;
    [self.arrCommodity removeObjectAtIndex:bt.tag];
    [self.m_tableView reloadData];
}

- (void)clear
{
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
@end
