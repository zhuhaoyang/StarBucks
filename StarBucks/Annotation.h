//
//  Annotation.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-21.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>
{
	CLLocationCoordinate2D  coordinate;
	NSString  *title;
	NSString  *subtitle;
	id delegate;
    NSString *str;
    //自己定义的其他信息成员
}

@property (nonatomic,assign)  CLLocationCoordinate2D  coordinate;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *subtitle;
//@property (nonatomic,weak) id delegate;

- (id) initWithCoordinate:(CLLocationCoordinate2D)temp_coordinate;
- (void)setDelegate:(id)m_delegate;
//- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end