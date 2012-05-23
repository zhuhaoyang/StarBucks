//
//  GoogleMapViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-15.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"

@interface GoogleMapViewController : UIViewController
<MKMapViewDelegate,CLLocationManagerDelegate,MKAnnotation>{
    MKMapView * mapView;
    CLLocationManager *m_CLLocationManager;
    UIButton *bt;
    Annotation *myAnnotation;
}

@property(nonatomic,strong) MKMapView *mapView;
@property(nonatomic,strong) CLLocationManager *m_CLLocationManager;
@property(nonatomic,strong) UIButton *bt;
@property(nonatomic,strong) Annotation *myAnnotation;
@end
