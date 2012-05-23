//
//  Global.m
//  greenBerryReader
//
//  Created by haoyang zhu on 12-2-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Global.h"

static Global *instance = nil;


@implementation Global

- (id)init
{
	self = [super init];
	if (self)
	{

    }
	return self;
}

//- (void)dealloc
//{
//    [documentPath release];
//	[super dealloc];
//}

#pragma mark -
#pragma mark Class Methods
+ (Global *) sharedGlobal
{
	if (nil == instance)
	{
		instance = [[self alloc] init];
	}
	return instance;
}


@end
