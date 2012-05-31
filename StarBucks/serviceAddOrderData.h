//
//  serviceAddOrderData.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-25.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceInterface.h"

@protocol serviceAddOrderDataCallBackDelegate <NSObject>

@optional
- (void)serviceAddOrderDataCallBack:(NSDictionary *)dicCallBack withErrorMessage:(Error *)error;


@end

@interface serviceAddOrderData : serviceInterface{

}

@property(nonatomic,weak)id <serviceAddOrderDataCallBackDelegate>m_delegate;

- (id)initWithDelegate:(id<serviceAddOrderDataCallBackDelegate>)aDelegate requestMode:(TRequestMode)mode;

@end
