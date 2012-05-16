//
//  BaiduMapViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-15.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "BaiduMapViewController.h"
#import "MapPointAnnotion.h"

#define MAP_ANNVIEW_I_TAG 78000

@interface BaiduMapViewController ()

@end

@implementation BaiduMapViewController
@synthesize _search;
@synthesize _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _search = [[BMKSearch alloc]init];
        NSLog(@"%@",[[BMKSearch alloc]init]);
        NSLog(@"%@",_search);

    }
    return self;
}

#pragma mark - 百度地图

#pragma mark-
#pragma mark 定位委托
//开始定位
- (void)mapViewWillStartLocatingUser:(BMKMapView *)mapView{
    
    NSLog(@"开始定位");
    
    
    
}

//更新坐标

-(void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation{
    
    NSLog(@"更新坐标");
    
    //    [mapView setShowsUserLocation:NO];
    
    
    //给view中心定位
    BMKCoordinateRegion region;
    region.center.latitude  = userLocation.location.coordinate.latitude;
    region.center.longitude = userLocation.location.coordinate.longitude;
    region.span.latitudeDelta  = 0.25;
    region.span.longitudeDelta = 0.25;
    _mapView.region   = region;
    
    //加个当前坐标的小气泡
    [_search reverseGeocode:userLocation.location.coordinate];
    _mapView.showsUserLocation = NO; 
    
}

//定位失败

-(void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    
    NSLog(@"定位错误%@",error);
    
    [mapView setShowsUserLocation:NO];
    
}

//定位停止

-(void)mapViewDidStopLocatingUser:(BMKMapView *)mapView{
    
    NSLog(@"定位停止");  
}

#pragma mark-
#pragma mark 区域改变

/**
 *地图区域即将改变时会调用此接口
 *@param mapview 地图View
 *@param animated 是否动画
 */
- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"地图区域即将改变");
}

/**
 *地图区域改变完成后会调用此接口
 *@param mapview 地图View
 *@param animated 是否动画
 */
- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"地图区域改变完成");
}

#pragma mark-
#pragma mark 标注
/**
 *根据anntation生成对应的View
 *@param mapView 地图View
 *@param annotation 指定的标注
 *@return 生成的标注View
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    
    NSLog(@"生成标注");
    
    BMKAnnotationView *annotationView =[mapView viewForAnnotation:annotation];
    
    if (annotationView==nil&&[annotation isKindOfClass:[MapPointAnnotion class]]) 
    {
        MapPointAnnotion* pointAnnotation=(MapPointAnnotion*)annotation;
        NSString *AnnotationViewID = [NSString stringWithFormat:@"iAnnotation-%i",pointAnnotation.tag];
		annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation 
                                                          reuseIdentifier:AnnotationViewID]; 
        
        if ([[pointAnnotation subtitle] isEqualToString:@"我的位置"])
        {
            ((BMKPinAnnotationView*) annotationView).pinColor = BMKPinAnnotationColorRed;   
        }else if([[pointAnnotation subtitle] isEqualToString:@"目标位置"]){
            ((BMKPinAnnotationView*) annotationView).pinColor = BMKPinAnnotationColorPurple;  
        }else{
            ((BMKPinAnnotationView*) annotationView).pinColor = BMKPinAnnotationColorGreen; 
        }
        
		((BMKPinAnnotationView*)annotationView).animatesDrop = YES;// 设置该标注点动画显示
        
        
        annotationView.centerOffset = CGPointMake(0, -(annotationView.frame.size.height * 0.5));
        annotationView.annotation = annotation;
        
        annotationView.canShowCallout = TRUE;
        annotationView.tag=pointAnnotation.tag;
        
        
        
	}
	return annotationView ; 
}

/**
 *当mapView新添加annotation views时，调用此接口
 *@param mapView 地图View
 *@param views 新添加的annotation views
 */
- (void)mapView:(BMKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"添加多个标注");
}

/**
 *当选中一个annotation views时，调用此接口
 *@param mapView 地图View
 *@param views 选中的annotation views
 */
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    NSLog(@"选中标注");
}

/**
 *当取消选中一个annotation views时，调用此接口
 *@param mapView 地图View
 *@param views 取消选中的annotation views
 */
- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view
{
    NSLog(@"取消选中标注");
}

#pragma mark-
#pragma mark 地理编码和反地理编码

- (void)onGetTransitRouteResult:(BMKPlanResult*)result errorCode:(int)error
{
}

- (void)onGetDrivingRouteResult:(BMKPlanResult*)result errorCode:(int)error
{
}

- (void)onGetWalkingRouteResult:(BMKPlanResult*)result errorCode:(int)error
{
}

- (void)onGetPoiResult:(NSArray*)poiResultList searchType:(int)type errorCode:(int)error
{
}

- (void)onGetAddrResult:(BMKAddrInfo*)result errorCode:(int)error
{
	if (error == 0) {
		MapPointAnnotion* item = [[MapPointAnnotion alloc]init];
		item.coordinate = result.geoPt;
		item.title = result.strAddr;
        item.subtitle=@"我的位置";
		[_mapView addAnnotation:item];
		[item release];
        
        NSLog(@"添加地名名称标注");
	}
    
}
#pragma mark - fun
-(void)cleanMap
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    
    for (MapPointAnnotion* ann in array) {
        [_mapView removeAnnotation:ann];
    }
}


#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _search.delegate = self;
    NSLog(@"%@",_mapView);
    _mapView.delegate = self;
    [_mapView setShowsUserLocation:YES];
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

@end
