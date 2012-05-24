//
//  serviceTest.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-24.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceInterface.h"


@protocol serviceTestCallBackDelegate<NSObject>

@optional
-(void)serviceTestCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error;

@end

@interface serviceTest : serviceInterface{
    // delegate
//	id<serviceTestCallBackDelegate> m_delegate;
}

@property(nonatomic,weak) id<serviceTestCallBackDelegate> m_delegate;

-(id)initWithDelegate:(id<serviceTestCallBackDelegate>)aDelegate 
		  requestMode:(TRequestMode)mode;

@end
