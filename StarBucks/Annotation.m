//
//  Annotation.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-21.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
//@synthesize delegate = _delegate;
- (id) initWithCoordinate:(CLLocationCoordinate2D)temp_coordinate
{
    if ([super init])
    {

        self.coordinate = temp_coordinate;
        NSLog(@"initWithCoordinate %f",self.coordinate.latitude);
        NSLog(@"initWithCoordinate %f",self.coordinate.longitude);
//        coordinate.latitude =  1;
//        coordinate.longitude = 1;
    }	
	return  self;
}


- (void)setDelegate:(id)m_delegate
{
    delegate = m_delegate;
}

//- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
//{
//    self.coordinate = newCoordinate;
//    NSLog(@"setCoordinate %f",coordinate.latitude);
//    NSLog(@"setCoordinate %f",coordinate.longitude);
//
//}

@end
