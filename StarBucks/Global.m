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
@synthesize dicShopCart = _dicShopCart;
@synthesize arrOrder = _arrOrder;


- (id)init
{
	self = [super init];
	if (self)
	{
        self.dicShopCart = [[NSMutableDictionary alloc]init];
        self.arrOrder = [[NSMutableArray alloc]init];
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
