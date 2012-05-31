//
//  serviceGetOrderData.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-25.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceGetOrderData.h"

@implementation serviceGetOrderData
@synthesize m_delegate = _m_delegate;

-(id)initWithDelegate:(id<serviceGetOrderDataCallBackDelegate>)aDelegate 
		  requestMode:(TRequestMode)mode
{
	self = [self init];
	if (self)
	{
		self.m_delegate = aDelegate;
		m_requestMode = mode;
	}
	return self;
}

- (void)parseResponseData:(NSString *)xml
{
    if (xml == nil || [xml isEqualToString:@""])
	{
		NSString *sMsg = [[NSString alloc] initWithFormat:@"Empty response xml file!"];
		self.m_error.m_Message = sMsg;
        //		SAFE_RELEASE(sMsg);
		return;
    }
    NSLog(@"%@",xml);
    
    NSMutableArray *arrData = [[NSMutableArray alloc]init];
    NSError *error = [[NSError alloc] init];
    m_dicReceiveData = [[NSMutableDictionary alloc]init];
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:&error];
    
    if (doc == nil) { return; }
    
    GDataXMLElement *rootElement = [doc rootElement];
	NSArray *array1 = [rootElement nodesForXPath:@"//Orders" error:nil];
    NSInteger n = [array1 count];
    for (NSInteger i = 1; i <= n; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        NSArray *array2 = [rootElement nodesForXPath:[NSString stringWithFormat:@"//Orders[%i]/*",i] error:nil];
        for (GDataXMLElement *oneElement in array2) {
            [dic setObject:[oneElement stringValue] forKey:[oneElement name]];
        }
        [arrData addObject:dic];

    }
    [m_dicReceiveData setObject:arrData forKey:@"Orders"];
}

- (void)passDataOutWithError:(Error*)error
{
	if (nil != self.m_delegate
		&& [self.m_delegate respondsToSelector:@selector(serviceGetOrderDataCallBack: withErrorMessage:)])
	{
		[self.m_delegate serviceGetOrderDataCallBack:m_dicReceiveData withErrorMessage:error];
	}
}

@end
