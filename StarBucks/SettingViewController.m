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
    NSString *xml =[NSString stringWithString:@"<DataSet> -<diffgr:diffgram xmlns:msdata=\"urn:schemas-microsoft-com:xml-msdata\" xmlns:diffgr=\"urn:schemas-microsoft-com:xml-diffgram-v1\"> -<NewDataSet xmlns=\"\"> -<Orders diffgr:id=\"Orders1\" msdata:rowOrder=\"0\"> <OrderId>2</OrderId> <ProductName>星冰乐</ProductName> <UserName>liyou</UserName> <ShopName>星巴克</ShopName> <Number>2</Number> <Price>20.0000</Price> <TotalPrice>40.0000</TotalPrice> <CreateTime>2012-05-22T00:00:00+08:00</CreateTime> <OrderStates>已提货</OrderStates> </Orders> -<Orders diffgr:id=\"Orders2\" msdata:rowOrder=\"1\"> <OrderId>3</OrderId> <ProductName>拿铁</ProductName> <UserName>ace</UserName> <ShopName>人民广场</ShopName> <Number>3</Number> <Price>20.0000</Price> <TotalPrice>60.0000</TotalPrice> <CreateTime>2012-05-22T00:00:00+08:00</CreateTime> <OrderStates>已提货</OrderStates> </Orders> -<Orders diffgr:id=\"Orders3\" msdata:rowOrder=\"2\"> <OrderId>4</OrderId> <ProductName>咖啡</ProductName> <UserName>张三</UserName> <ShopName>星巴克外滩店</ShopName> <Number>3</Number> <Price>20.0000</Price> <TotalPrice>60.0000</TotalPrice> <CreateTime>2012-05-21T00:00:00+08:00</CreateTime> <OrderStates>未提货</OrderStates> </Orders> </NewDataSet> </diffgr:diffgram> </DataSet>"];
    
    NSMutableArray *arrData = [[NSMutableArray alloc]init];
    NSError *error = [[NSError alloc] init];
    
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:&error];

    if (doc == nil) { return; }

    GDataXMLElement *rootElement = [doc rootElement];
	NSArray *array1 = [rootElement nodesForXPath:@"//Orders" error:nil];
    for (GDataXMLElement *element in array1) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        NSArray *array2 = [element nodesForXPath:@"//Orders/*" error:nil];
        for (GDataXMLElement *oneElement in array2) {
            [dic setObject:[oneElement stringValue] forKey:[oneElement name]];
        }
        [arrData addObject:dic];
    }

    NSLog(@"%@",arrData);
    
    
    
    
    
    
    
    
    
    
//    self.m_serviceTest = [[serviceTest alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
//    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"2",@"OrderId", nil];
//    NSString *str = [NSString stringWithFormat:@"OrderId=2"];
//    [self.m_serviceTest sendRequestWithData:str addr:@"GetOrderData"];
    
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
