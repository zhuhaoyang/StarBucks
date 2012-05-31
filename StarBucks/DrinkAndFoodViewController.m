//
//  DrinkAndFoodViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "DrinkAndFoodViewController.h"
#import "NSDictionary-DeepMutableCopy.h"


//@interface NSDictionary(DeepMutableCopy)
//-(NSMutableDictionary *)mutableDeepCopy;
//@end
//
//@implementation NSDictionary(DeepMutableCopy)
//-(NSMutableDictionary *)mutableDeepCopy
//{
//    NSMutableDictionary *ret = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
//    NSArray *keys = [self allKeys];
//    for (id key in keys)
//    {
//        id oneValue = [self valueForKey:key];
//        id oneCopy = nil;
//        
//        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
//            oneCopy = [oneValue mutableDeepCopy];
//        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
//            oneCopy = [oneValue mutableCopy];
//        if (oneCopy == nil)
//            oneCopy = [oneValue copy];
//        [ret setValue:oneCopy forKey:key];
//    }
//    return ret;
//}
//@end


@interface DrinkAndFoodViewController ()

@end

@implementation DrinkAndFoodViewController
@synthesize m_tableView = _m_tableView;
@synthesize segment = _segment;
@synthesize searchBar = _searchBar;
@synthesize dicCopy = _dicCopy;
@synthesize dicDrinkAndFood = _dicDrinkAndFood;
@synthesize m_BuyViewController = _m_BuyViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)selectedSegment
{
//    NSLog(@"%i",self.segment.selectedSegmentIndex);
    [self.m_tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.segment.selectedSegmentIndex = 0;
    [self.segment addTarget:self action:@selector(selectedSegment) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view from its nib.
    self.title = @"饮品美食";
    NSArray *arrHot = [[NSArray alloc]initWithObjects:@"焦糖玛奇朵",@"焦糖玛奇朵",@"焦糖玛奇朵",@"焦糖玛奇朵", nil];
    NSArray *arrIce = [[NSArray alloc] initWithObjects:@"冰拿铁", @"冰拿铁",@"冰拿铁",@"冰拿铁",nil];
    dicEspresso = [[NSDictionary alloc]initWithObjectsAndKeys:arrHot,@"Hot",arrIce,@"Ice", nil];
    
    NSArray *arrCoffee = [[NSArray alloc]initWithObjects:@"焦糖咖啡星冰乐", @"焦糖咖啡星冰乐",@"焦糖咖啡星冰乐",@"焦糖咖啡星冰乐",nil];
    NSArray *arrWithoutCoffee = [[NSArray alloc]initWithObjects:@"抹茶星冰乐", @"抹茶星冰乐",@"抹茶星冰乐",@"抹茶星冰乐",nil];
    NSArray *arrFruitTea = [[NSArray alloc]initWithObjects:@"芒果西番莲果茶星冰乐",@"芒果西番莲果茶星冰乐",@"芒果西番莲果茶星冰乐",@"芒果西番莲果茶星冰乐", nil];
    dicFrappuccinos = [[NSDictionary alloc]initWithObjectsAndKeys:arrCoffee,@"Coffee",arrWithoutCoffee,@"WithoutCoffee",arrFruitTea,@"FruitTea", nil];
    
    NSArray *arrFreshlyPreparedCoffee = [[NSArray alloc]initWithObjects:@"密斯朵咖啡", @"密斯朵咖啡",@"密斯朵咖啡",@"密斯朵咖啡",nil];
    NSArray *arrTea = [[NSArray alloc]initWithObjects:@"伯爵红茶",@"星巴克碧螺春绿茶",@"印度红茶", @"伯爵红茶",@"星巴克碧螺春绿茶",@"印度红茶",nil];
    NSArray *arrOther = [[NSArray alloc]initWithObjects:@"牛奶", @"牛奶",@"牛奶",@"牛奶",nil];
    dicCoffeeAndTea = [[NSDictionary alloc]initWithObjectsAndKeys:arrFreshlyPreparedCoffee,@"FreshlyPreparedCoffee",arrTea,@"Tea",arrOther,@"Other", nil];
    
    dicDessert = [[NSDictionary alloc]initWithObjectsAndKeys:[[NSArray alloc]initWithObjects:@"甘薯杯子蛋糕",@"巧克力麦芬", @"甘薯杯子蛋糕",@"巧克力麦芬",@"甘薯杯子蛋糕",@"巧克力麦芬",nil],@"dessert", nil];
    
    dicDrinkAndFood = [[NSDictionary alloc]initWithObjectsAndKeys:dicEspresso,@"espresso",dicFrappuccinos,@"frappuccinos",dicCoffeeAndTea,@"coffeeAndTea",dicDessert,@"dessert", nil];

    
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (NSMutableDictionary *)mutableDeepCopy:(NSDictionary *)dic
//{
//    NSMutableDictionary *ret = [[NSMutableDictionary alloc] initWithCapacity:[dic count]];
//    NSArray *keys = [dic allKeys];
//    for (id key in keys)
//    {
//        id oneValue = [dic valueForKey:key];
//        id oneCopy = nil;
//        
//        if ([self respondsToSelector:@selector(mutableDeepCopy:)])
//            oneCopy = [self mutableDeepCopy:dic];
//        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
//            oneCopy = [oneValue mutableCopy];
//        if (oneCopy == nil)
//            oneCopy = [oneValue copy];
//        [ret setValue:oneCopy forKey:key];
//    }
//    return ret;
//}


#pragma mark -
#pragma mark Table Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section 
{

    NSDictionary *dic = nil;
    NSInteger n;
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            dic = dicEspresso;
            break;
        case 1:
            dic = dicFrappuccinos;
            break;
        case 2:
            dic = dicCoffeeAndTea;
            break;
        case 3:
            dic = dicDessert;
            break;
            
        default:
            dic = nil;
            break;
    }
    NSArray *arr= [dic allKeys];
    n = [[dic objectForKey:[arr objectAtIndex:(NSUInteger)section]] count];
    return n;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger n;
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            n = [[dicDrinkAndFood objectForKey:@"espresso"] count];
            break;
        case 1:
            n = [[dicDrinkAndFood objectForKey:@"frappuccinos"] count];
            break;
        case 2:
            n = [[dicDrinkAndFood objectForKey:@"coffeeAndTea"] count];
            break;
        case 3:
            n = [[dicDrinkAndFood objectForKey:@"dessert"] count];
            break;
            
        default:
            n = 4;
            break;
    }
//    NSLog(@"%i",segment.selectedSegmentIndex);
    return n;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dic = nil;
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            dic = dicEspresso;
            break;
        case 1:
            dic = dicFrappuccinos;
            break;
        case 2:
            dic = dicCoffeeAndTea;
            break;
        case 3:
            dic = dicDessert;
            break;
            
        default:
            dic = nil;
            break;
    }
    NSArray *arr= [dic allKeys];
    return [arr objectAtIndex:(NSUInteger)section];

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    UITableViewCell *cell = cell =[[UITableViewCell alloc]init];
            
//    static NSString *DrinkAndFood= @"DrinkAndFood";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
//                             DrinkAndFood];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
//                                       reuseIdentifier: DrinkAndFood];
//    }

    
    NSDictionary *dic = nil;
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            dic = dicEspresso;
            break;
        case 1:
            dic = dicFrappuccinos;
            break;
        case 2:
            dic = dicCoffeeAndTea;
            break;
        case 3:
            dic = dicDessert;
            break;
            
        default:
            dic = nil;
            break;
    }
    NSArray *arr= [dic allKeys];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(115, 30, 200, 20)];
    label.text = [[dic objectForKey:[arr objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
    image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",label.text]];
    
    [cell addSubview:label];
    [cell addSubview:image];

    
//    [NSString stringWithFormat:@"%i",[indexPath row]];
    return cell;
}
#pragma mark -
#pragma mark Table Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select Row:%i",[indexPath row]);
    m_BuyViewController = [[BuyViewController alloc]initWithNibName:@"BuyViewController" bundle:nil];
    [self.navigationController pushViewController:m_BuyViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

//- (NSMutableDictionary *)deepCopy:(NSDictionary *)dic
//{
//    
//}

#pragma mark -
#pragma mark Search Bar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    NSMutableDictionary *allNamesCopy = [self.dicDrinkAndFood mutableDeepCopy];
//    self.dicCopy = [[NSMutableDictionary alloc]initWithDictionary:[self.dicDrinkAndFood mutableDeepCopy]];
//    dicCopy = [dicDrinkAndFood mutableCopy];
//    NSLog(@"dicCopy = %@",dicCopy);
//    NSLog(@"dicDrinkAndFood = %@",dicDrinkAndFood);
//    [[dicCopy objectForKey:@"frappuccinos"] removeObjectForKey:@"WithoutCoffee"];
//    NSLog(@"dicCopy = %@",self.dicCopy);
//    NSLog(@"dicDrinkAndFood = %@",self.dicDrinkAndFood);

//    NSLog(@"dicDrinkAndFood = %@",dicDrinkAndFood);
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{

}

- (void)searchBar:(UISearchBar *)searchBar 
    textDidChange:(NSString *)searchTerm
{
       
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.searchBar.text = @"";   
    [self.searchBar resignFirstResponder];
}


@end
