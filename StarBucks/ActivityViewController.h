//
//  ActivityViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagePhotosDataSource.h"
#import "PagePhotosView.h"


@interface ActivityViewController : UIViewController
<PagePhotosDataSource,ActivityDelegate>{
    UITableView *__weak m_tableView;
    UISegmentedControl * segment;
    
    PagePhotosView *m_pagePhotosView;
    
    NSMutableArray *arrImage;
    UIButton *bigBt;
}

@property(nonatomic,weak) IBOutlet UITableView *m_tableView;
@property(nonatomic,strong)  UISegmentedControl *segment;
@property(nonatomic,strong) PagePhotosView *m_pagePhotosView;

-(void) clickedImage:(UIButton*)bt;
//- (void)remove;
@end
