//
//  ViewController.m
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-9.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timer = _timer;
@synthesize splashImageView = _splashImageView;
@synthesize navController = _navController;
@synthesize m_homePageViewController = _m_homePageViewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self showMainView]; 
    
    splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"startLoge"]];
    splashImageView.frame = CGRectMake(0, -20, 320, 480);
    
    [self.view addSubview: splashImageView];
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 
                                             target: self 
                                           selector: @selector(fadeScreen) 
                                           userInfo: nil repeats: NO];
    
}

- (void) fadeScreen
{
	[UIView beginAnimations: nil context: nil];
	[UIView setAnimationDuration: 0.5f];
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDidStopSelector: @selector(finishedFading)];
	self.view.alpha = 0.0;
	[UIView commitAnimations];
}

- (void) finishedFading
{
	[UIView beginAnimations: nil context: nil];
	[UIView setAnimationDuration: 0.5f];
	self.view.alpha = 1.0;
	[UIView commitAnimations];
	[splashImageView removeFromSuperview];
    
    [self showMainView];
}



- (void)showMainView 
{
    m_homePageViewController = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:[NSBundle mainBundle]];
    
    //    [m_homePageViewController.view setFrame: CGRectMake(0, 0, 320, 480)];
    
    navController = [[UINavigationController alloc]initWithRootViewController:m_homePageViewController];
    //    [NSBundle mainBundle]
    //    self.title = @"首页";
    [navController.view setFrame:CGRectMake(0, -20, 320, 480)];
    navController.navigationBar.tintColor = [UIColor colorWithRed:0.3098 green:0.5569 blue:0.1059 alpha:1];
    //    [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:navController.view];
    //    [self.view bringSubviewToFront:self.bt1];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
