//
//  GoogleMapViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-15.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "GoogleMapViewController.h"

@interface GoogleMapViewController ()

@end

@implementation GoogleMapViewController
@synthesize mapView = _mapView;
@synthesize m_CLLocationManager = _m_CLLocationManager;
@synthesize bt = _bt;
@synthesize myAnnotation = _myAnnotation;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.bt.frame = CGRectMake(10, 320, 50, 30);
    [self.bt addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bt];
    
    self.m_CLLocationManager = [[CLLocationManager alloc]init];
    self.m_CLLocationManager.delegate = self;
    [self.m_CLLocationManager startUpdatingLocation];
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    NSLog(@"%i",self.mapView.mapType);
    self.mapView.showsUserLocation = YES;
    NSLog(@"showsUserLocation = %i",self.mapView.showsUserLocation);
    [self.view addSubview:self.mapView];
    
    
//    MKCoordinateRegion region;
//    region.center = worldCity.coordinate;
//    MKCoordinateSpan span = {0.4, 0.4};
//    region.span = span;
//    [mapView setRegion:region animated:YES];
}

- (void)clicked:(id)sender
{


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark MapKit Delegate Methods


- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"警告" 
                                                  message:@"地图加载失败!" 
                                                 delegate:self 
                                        cancelButtonTitle:@"确认" 
                                        otherButtonTitles:nil];
    [aler show];
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation
{
	//判断是否是自己
    NSLog(@"判断是否是自己latitude = %f",annotation.coordinate.latitude);
    NSLog(@"判断是否是自己longitude = %f",annotation.coordinate.longitude);
    if (![annotation isKindOfClass:[Annotation class]])
	{
        Annotation * m_annotation = annotation;
        m_annotation.title=@"当前位置";
        return  nil;

	}
	else 
	{
        MKAnnotationView *view;
        view = (MKAnnotationView *)[self.mapView  dequeueReusableAnnotationViewWithIdentifier:annotation.title];
		
		
		if (view==nil)
		{
			view = [[MKAnnotationView  alloc] initWithAnnotation:annotation reuseIdentifier:annotation.title];
		}
		else 
		{
			view.annotation=annotation;
		}
		
		
		//设置图标
        //		Annotation * m_annotation = annotation;
		[view   setImage:[UIImage  imageNamed:@"starbucks_001"] ];
        view.frame = CGRectMake(0, 0, 30, 45);
//        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];

        UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"starbucks_03"]];
        leftImage.frame = CGRectMake(0, 0, 30, 30);
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:self action:@selector(clickedBt:) forControlEvents:UIControlEventTouchUpInside];

        view.centerOffset = CGPointMake(0, -17.5);
        
        view.leftCalloutAccessoryView = leftImage;
        view.rightCalloutAccessoryView = rightButton;
		view.canShowCallout = YES;
		return   view;

	}
}

- (void)clickedBt:(id)sender
{
    NSLog(@"clicked!!");
}

#pragma mark -
#pragma mark CLLocationManager Delegate Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (self.mapView.userLocationVisible == 1) {
        [self.m_CLLocationManager stopUpdatingLocation];
        CLLocationCoordinate2D coords = self.mapView.userLocation.location.coordinate;
        NSLog(@"userLocationVisible = %i",self.mapView.userLocationVisible);
//        NSLog(@"%@",coords);
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coords, 2000, 2000);
        MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
        
//        Annotation *annotation = [[Annotation alloc]initWithCoordinate:self.mapView.userLocation.location.coordinate];
//        [self.mapView addAnnotation:annotation];
//        CLLocationCoordinate2D test;
//        test.latitude = 30.273699;
//        test.longitude = 120.136753;
//        Annotation *annotation = [[Annotation alloc]initWithCoordinate:test];
//        [annotation setDelegate:self];
//        [self.mapView addAnnotation:annotation];/Users/jy01902848/Desktop/starbucks_001.png
        CLLocationCoordinate2D test;
        test.latitude = 30.273699;
        test.longitude = 120.136753;
//        30.274200
//        120.136753
        CLLocation *loc1 = self.mapView.userLocation.location;
        CLLocation *loc2 = [[CLLocation alloc]initWithLatitude:30.273699 longitude:120.136753];
        CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
//        NSLog(@"location.latitude = %f",self.mapView.userLocation.location.coordinate.latitude);
//        NSLog(@"location.longitude = %f",self.mapView.userLocation.location.coordinate.longitude);
        NSLog(@"Distance = %f",distance);
        //   Annotation *annotation;
        if (self.myAnnotation == nil) {
            self.myAnnotation = [[Annotation alloc]initWithCoordinate:test];
            
        }else {
            self.myAnnotation.coordinate = test;
        }
        NSLog(@"clicked latitude = %f",self.myAnnotation.coordinate.latitude);
        NSLog(@"clicked longitude = %f",self.myAnnotation.coordinate.longitude);
        
        self.myAnnotation.title = @"星巴克(教工路店)";
        self.myAnnotation.subtitle = @"0571-80000000";
        
        //    NSLog(@"%i",self.mapView.userLocation.location.coordinate);
        [self.myAnnotation setDelegate:self];
        [self.mapView addAnnotation:self.myAnnotation];
        NSLog(@"clicked latitude = %f",self.myAnnotation.coordinate.latitude);
        NSLog(@"clicked longitude = %f",self.myAnnotation.coordinate.longitude);

        
        [self.mapView setRegion:adjustedRegion animated:YES];

    }
}

@end
