//
//  serviceInterface.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-24.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceInterface.h"


@interface serviceInterface(private)
- (GDataXMLElement *)creatRequestBody:(NSDictionary*)aDic key:(NSString *)key;
- (void)parseResponseData:(NSString *)xml;
- (void)passDataOutWithError:(Error*)error;

@end


@implementation serviceInterface
@synthesize m_request = _m_request;
//@synthesize m_requestMode;
@synthesize m_error = _m_error;
@synthesize m_dicReceiveData = _m_dicReceiveData;
#pragma mark -
#pragma mark Initialization & Deallocation

-(id)init
{
	self = [super init];
	if (self)
	{
		m_request = nil;
		m_dicReceiveData = nil;
		m_error = [[Error alloc] init];
		m_requestMode = TRequestMode_Asynchronous;// set default
	}
	return self;
}

//-(id)initWithDelegate:(id<serviceCallBackDelegate>)aDelegate 
//		  requestMode:(TRequestMode)mode
//{
//	self = [self init];
//	if (self)
//	{
//		m_delegate = aDelegate;
//		m_requestMode = mode;
//	}
//	return self;
//}

//-(void)dealloc
//{
//	[super dealloc];
//	if (nil != m_request) [m_request cancel];
//	[m_request release];
//	[m_dicReceiveData release];
//	[m_error release];
//}

#pragma mark -
#pragma mark RequestCreation and Request sending

-(void)sendRequestWithData:(NSString*)str addr:(NSString *)addr
{
	if (nil == m_request)
	{
        //        UITextView *tx;
		//服务器地址
        
		NSString *theServerAddr	= @"http://58.246.148.238/mywebservice/Service1.asmx/";
		//[[SystemSetting shareInstance] getServerUrl];
		//拼凑请求地址
		NSString *httpStr = [[NSString alloc] initWithFormat:@"%@%@",theServerAddr,addr];
		NSURL *url = [[NSURL alloc] initWithString:httpStr];
		
		// Initialization the http engine (required)
		m_request = [[ASIFormDataRequest alloc] initWithURL:url];
		[m_request setRequestMethod:@"POST"]; // set post method
		[m_request setTimeOutSeconds:kTimeOutDuration]; // set time out duration
		[m_request setDelegate:self];
	}
	
	// Create body (required)
//	GDataXMLElement *element = [GDataXMLNode elementWithName:@"OrderId" stringValue:@"2"];
    

    
//    GDataXMLElement *element = [self creatRequestBody:aDic key:@"body"];

//	GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithRootElement:element];
//	[document setVersion:@"1.0"];
//	[document setCharacterEncoding:@"UTF-8"];
//    NSData *bodyData = [document XMLData];
//	NSString * str = [[NSString alloc]initWithData:bodyData encoding:NSUTF8StringEncoding];
    
//    NSString * str = [[NSString alloc]initWithString:@"OrderId=2"];

    
	LOGS(@"required = %@",str);
//	[str release];
	// Add header (optional)
	NSString *sDataLength = [[NSString alloc] initWithFormat:@"%d", [str length]];
	[m_request addRequestHeader:@"Content-length" value:sDataLength];
    
    [m_request addRequestHeader:@"Content-Type"value:@"application/x-www-form-urlencoded"];
//    [theRequest addRequestHeader:@"SOAPAction"value:@"http://tempuri.org/AddOrderData"];
//    
    [m_request appendPostData:[str dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [theRequest setDefaultResponseEncoding:NSUTF8StringEncoding];
    
    
    
//	SAFE_RELEASE(sDataLength);
    
	// Add body data (required)
//	[m_request appendPostData:bodyData];
	
	// Send request (required)
	switch (m_requestMode)
	{
		case TRequestMode_Synchronous:
		{
			[m_request startSynchronous];
            
			NSError *error = [m_request error];
			if (!error)
			{
				NSString *sReponse = [m_request responseString];
				[self parseResponseData:sReponse];
				[self passDataOutWithError:m_error];
			}
			else
			{
				if (nil != m_dicReceiveData)
				{
//					SAFE_RELEASE(m_dicReceiveData);
				}
				m_error.m_NSError = error;
				[self passDataOutWithError:m_error];
			}
			break;
		}
		case TRequestMode_Asynchronous:
		default:
		{
			[m_request startAsynchronous];
			break;
		}
	}
}

// Create the body
//- (GDataXMLElement *)creatRequestBody:(NSDictionary*)aDic key:(NSString *)key
//{
//	GDataXMLElement * rootElement = [GDataXMLNode elementWithName:key];
//	GDataXMLElement * oneElement;
//	NSArray * allKeys = [aDic allKeys];
//	NSUInteger i, count = [allKeys count];
//	for(i = 0; i < count; i++){
//		
//		if ([[aDic objectForKey:[allKeys objectAtIndex:i]] isKindOfClass:[NSDictionary class]]) {
//			oneElement = [self creatRequestBody:[aDic objectForKey:[allKeys objectAtIndex:i]] key:[allKeys objectAtIndex:i]];
//		}else {
//			oneElement = [GDataXMLNode elementWithName:[allKeys objectAtIndex:i]
//										   stringValue:[aDic objectForKey:[allKeys objectAtIndex:i]]];
//		}
//		[rootElement addChild:oneElement];
//	}	
//	return rootElement;
//}

#pragma mark -
#pragma mark ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
	NSString *sReponse = [request responseString];
	[self parseResponseData:sReponse];
	[self passDataOutWithError:m_error];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
	NSError *error = [request error];
	if (nil != m_dicReceiveData)
	{
//		SAFE_RELEASE(m_dicReceiveData);
	}
	m_error.m_NSError = error;
	[self passDataOutWithError:m_error];
}

#pragma mark -
#pragma mark ReponseParsing
- (void)parseResponseData:(NSString *)xml
{
//	if (xml == nil || [xml isEqualToString:@""])
//	{
//		NSString *sMsg = [[NSString alloc] initWithFormat:@"Empty response xml file!"];
//		m_error.m_Message = sMsg;
//		SAFE_RELEASE(sMsg);
//		return;
//	}
//    
//	LOGS(@"xml = %@",xml);
//	
//	// Prepare the callback data (required)
//	if (nil != m_dicReceiveData)
//	{
//		SAFE_RELEASE(m_dicReceiveData);
//	}
//	
//	
//	m_dicReceiveData = [[NSMutableDictionary alloc] init];
//	NSError *error = [[NSError alloc] init];
//    
//	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:&error];
//    if (doc == nil) { return; }
//	
//	GDataXMLElement *rootElement = [doc rootElement];
//	GDataXMLElement *oneElement;
//	NSString *keyName;
//	NSArray *children;
//	NSArray *array = [rootElement nodesForXPath:@"//body/retcode" error:nil];
//	if ([[[array objectAtIndex:0] stringValue] isEqualToString:@"0"]) {
//		
//		NSMutableArray *arrData = [[[NSMutableArray alloc] init] autorelease];
//		
//		array = [rootElement nodesForXPath:@"//body/*" error:nil];
//        
//		NSUInteger i, count = [array count];
//		if (count > 1) {
//			keyName = [[array objectAtIndex:1] name];
//		}
//		for (i = 1; i < count; i++) {
//			oneElement = [array objectAtIndex:i];
//			NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
//			children = [oneElement children];
//			for(GDataXMLElement * element in children){
//				[dicData setObject:[element stringValue] forKey:[element name]];
//			}
//			[arrData addObject:dicData];
//			[dicData release];
//		}
//		
//		[m_dicReceiveData setObject:@"0" forKey:@"retcode"];
//		if (arrData != nil && [arrData count] != 0) {
//			[m_dicReceiveData setObject:arrData forKey:keyName];
//		}
//		
//		
//	}else{
//		[m_dicReceiveData setObject:[[array objectAtIndex:0] stringValue] forKey:[[array objectAtIndex:0] name]];
//		array = [rootElement nodesForXPath:@"//body/message" error:nil];
//		[m_dicReceiveData setObject:[[array objectAtIndex:0] stringValue] forKey:[[array objectAtIndex:0] name]];
//	}
//	LOGS(@"m_dicReceiveData = %@",m_dicReceiveData);
//	[doc release];
}


#pragma mark -
#pragma mark serviceCallBackDelegateCallBack
- (void)passDataOutWithError:(Error*)error
{
    //	if (nil != m_delegate
    //		&& [m_delegate respondsToSelector:@selector(serviceCallBack: withErrorMessage:)])
    //	{
    //		[m_delegate serviceCallBack:m_dicReceiveData withErrorMessage:error];
    //	}
}

@end

