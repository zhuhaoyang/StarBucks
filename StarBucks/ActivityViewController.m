//
//  ActivityViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController
@synthesize m_tableView = _m_tableView;
@synthesize segment = _segment;
@synthesize m_pagePhotosView = _m_pagePhotosView;

-(void) clickedImage:(UIButton*)bt;
{
    NSLog(@"clicked:%i",bt.tag);
//    if (bt.tag == 1) {
//        bigBt = bt;
    if (bigBt != nil) {
        [bigBt removeFromSuperview];
        bigBt = nil;
    }
    bigBt = [[UIButton alloc]init ];//WithFrame:CGRectMake(80, 30, 160, 225)];
    [bigBt setBackgroundImage:bt.currentBackgroundImage forState:UIControlStateNormal];
    bigBt.frame = CGRectMake(160, 122.5, 1, 1);

    [bigBt addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigBt];
//    bigBt.tag = 2;

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelay:0.3];
    

    bigBt.frame = CGRectMake(0, 0, 320, 460);
    
    
    [UIView commitAnimations];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)reduce
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationDelay:0.3];


    bigBt.frame = CGRectMake(160, 122.5, 0, 0);


    [UIView commitAnimations];
    [self.navigationController setNavigationBarHidden:NO animated:YES];            

        
//    [self performSelector:@selector(remove) withObject:nil afterDelay:0.3];
}

//- (void)remove
//{
//    [bigBt removeFromSuperview];
//}

- (int)numberOfPages {
	return 6;
}

// 每页的图片
//
- (UIImage *)imageAtIndex:(int)index {
	return [UIImage imageNamed:[arrImage objectAtIndex:(NSUInteger)index]];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        arrImage = [[NSMutableArray alloc]initWithObjects:@"starbucks_02",@"starbucks_50",@"starbucks_02",@"starbucks_50",@"starbucks_02",@"starbucks_50", nil];
        self.m_pagePhotosView = [[PagePhotosView alloc] initWithFrame: CGRectMake(80, 30, 160, 245) withDataSource:self delegate:self];
        [self.view addSubview:self.m_pagePhotosView];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"活动推荐";
    NSArray *array = [[NSArray alloc]initWithObjects:@"最新活动",@"热门推荐",nil];	
	self.segment = [[UISegmentedControl alloc]initWithItems:array];
	self.segment.segmentedControlStyle = UISegmentedControlStyleBar;
	[self.segment addTarget:self action:@selector(changeSegmented) forControlEvents:UIControlEventValueChanged];
	self.segment.selectedSegmentIndex = 0;
	//[self.navigationController.navigationBar addSubview:segmented];
	self.navigationItem.titleView = self.segment;

    // Do any additional setup after loading the view from its nib.
}

- (void)changeSegmented
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


@end
