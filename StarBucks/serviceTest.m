//
//  serviceTest.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-24.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceTest.h"

@implementation serviceTest
@synthesize m_delegate = _m_delegate;

-(id)initWithDelegate:(id<serviceTestCallBackDelegate>)aDelegate 
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
    
	LOGS(@"xml = %@",xml);
	
	// Prepare the callback data (required)
	if (nil != m_dicReceiveData)
	{
//		SAFE_RELEASE(m_dicReceiveData);
	}
	
//	
//	m_dicReceiveData = [[NSMutableDictionary alloc] init];
//	NSError *error = [[NSError alloc] init];
//    
//	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:&error];
//    if (doc == nil) { return; }
//	
//	GDataXMLElement *rootElement = [doc rootElement];
//	NSArray *array = [rootElement nodesForXPath:@"//body/retcode" error:nil];
//	if ([[[array objectAtIndex:0] stringValue] isEqualToString:@"0"]) {
//        
//		[m_dicReceiveData setObject:@"0" forKey:@"retcode"];
//        
//	}else{
//        [m_dicReceiveData setObject:[[array objectAtIndex:0] stringValue] forKey:@"retcode"];
//		array = [rootElement nodesForXPath:@"//body/message" error:nil];
//		[m_dicReceiveData setObject:[[array objectAtIndex:0] stringValue] forKey:@"message"];
//	}
//	LOGS(@"m_dicReceiveData = %@",m_dicReceiveData);
//	[doc release];
    
}

- (void)passDataOutWithError:(Error*)error
{
	if (nil != self.m_delegate
		&& [self.m_delegate respondsToSelector:@selector(serviceTestCallBack: withErrorMessage:)])
	{
		[self.m_delegate serviceTestCallBack:m_dicReceiveData withErrorMessage:error];
	}
}

@end
