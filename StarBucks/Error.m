//
//  Error.m
//  VideoSurveillance
//
//  Created by zhuhaoyang on 11-12-14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Error.h"


@implementation Error
@synthesize m_NSError = _m_NSError;
@synthesize m_Message = _m_Message;

-(id)init
{
	self = [super init];
	if (self)
	{
		m_NSError = nil;
		m_Message = nil;
	}
	return self;
}

//-(void)dealloc
//{
//	[m_Message release];
//	[m_NSError release];
//	[super dealloc];
//}

@end
