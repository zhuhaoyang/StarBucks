//
//  BaiduMapViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-15.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface BaiduMapViewController : UIViewController
<BMKMapViewDelegate,BMKSearchDelegate>
{
    
    IBOutlet BMKMapView* _mapView;
    
    BMKSearch* _search;
}

@property(nonatomic,retain)BMKSearch* _search;
@property(nonatomic,retain)IBOutlet BMKMapView* _mapView;

@end
