//
//  SettingViewController.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-10.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "serviceTest.h"

@interface SettingViewController : UIViewController
<serviceCallBackDelegate>{
    UIButton *__weak btTest;
    serviceTest *m_serviceTest;
}

@property(nonatomic,weak) IBOutlet UIButton *btTest;
@property(nonatomic,strong) serviceTest *m_serviceTest;

- (IBAction)test:(id)sender;

@end
