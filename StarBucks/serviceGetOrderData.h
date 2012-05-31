//
//  serviceGetOrderData.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-25.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceInterface.h"

@protocol serviceGetOrderDataCallBackDelegate <NSObject>

@optional
- (void)serviceGetOrderDataCallBack:(NSDictionary *)dicCallBack withErrorMessage:(Error *)error;


@end

@interface serviceGetOrderData : serviceInterface{
    
}

@property(nonatomic,weak)id <serviceGetOrderDataCallBackDelegate>m_delegate;

- (id)initWithDelegate:(id<serviceGetOrderDataCallBackDelegate>)aDelegate requestMode:(TRequestMode)mode;

@end
