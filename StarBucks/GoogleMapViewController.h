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
@class DrinkAndFoodViewController;
@interface GoogleMapViewController : UIViewController
<MKMapViewDelegate,CLLocationManagerDelegate,MKAnnotation>{
    MKMapView * mapView;
    CLLocationManager *m_CLLocationManager;
//    UIButton *bt;
    Annotation *myAnnotation;
    UISegmentedControl *segmented;
    UITableView *m_tableView;
    DrinkAndFoodViewController *m_DrinkAndFoodViewController;
}

@property(nonatomic,strong) MKMapView *mapView;
@property(nonatomic,strong) CLLocationManager *m_CLLocationManager;
//@property(nonatomic,strong) UIButton *bt;
@property(nonatomic,strong) Annotation *myAnnotation;
@property(nonatomic,strong) UISegmentedControl *segmented;
@property(nonatomic,weak)IBOutlet UITableView *m_tableView;
@property(nonatomic,strong) DrinkAndFoodViewController *m_DrinkAndFoodViewController;
@end
