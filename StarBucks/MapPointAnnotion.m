//
//  MapPointAnnotion.m
//  txtw
//
//  Created by jian zhang on 12-4-10.
//  Copyright (c) 2012年 txtw.com. All rights reserved.
//

#import "MapPointAnnotion.h"

@implementation MapPointAnnotion
@synthesize tag;
@synthesize description;

-(void)dealloc
{
    [description release];
    [super dealloc];
}

@end
