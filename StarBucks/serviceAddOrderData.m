//
//  serviceAddOrderData.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-25.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceAddOrderData.h"

@implementation serviceAddOrderData
@synthesize m_delegate = _m_delegate;

-(id)initWithDelegate:(id<serviceAddOrderDataCallBackDelegate>)aDelegate 
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
    
    NSError *error = [[NSError alloc] init];
    m_dicReceiveData = [[NSMutableDictionary alloc]init];
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:&error];
    
    if (doc == nil) { return; }
    
    GDataXMLElement *rootElement = [doc rootElement];
	NSArray *array = [rootElement nodesForXPath:@"//*" error:nil];
    [m_dicReceiveData setObject:[[array objectAtIndex:0] stringValue] forKey:@"boolean"];
}

- (void)passDataOutWithError:(Error*)error
{
	if (nil != self.m_delegate
		&& [self.m_delegate respondsToSelector:@selector(serviceAddOrderDataCallBack: withErrorMessage:)])
	{
		[self.m_delegate serviceAddOrderDataCallBack:m_dicReceiveData withErrorMessage:error];
	}
}

@end
