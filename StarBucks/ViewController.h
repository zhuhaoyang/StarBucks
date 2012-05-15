//
//  ViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-9.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"

@interface ViewController : UIViewController
{
	NSTimer *timer;
	UIImageView *splashImageView;
    UINavigationController *navController;
    HomePageViewController *m_homePageViewController;
    
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIImageView *splashImageView;
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) HomePageViewController *m_homePageViewController;

- (void)fadeScreen;
- (void)finishedFading;
- (void)showMainView;

@end
