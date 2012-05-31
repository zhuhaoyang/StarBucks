//
//  serviceGetOrderData.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-25.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceInterface.h"

@protocol serviceGetOneOrderDataCallBackDelegate <NSObject>

@optional
- (void)serviceGetOneOrderDataCallBack:(NSDictionary *)dicCallBack withErrorMessage:(Error *)error;


@end

@interface serviceGetOneOrderData : serviceInterface{
    
}

@property(nonatomic,weak)id <serviceGetOneOrderDataCallBackDelegate>m_delegate;

- (id)initWithDelegate:(id<serviceGetOneOrderDataCallBackDelegate>)aDelegate requestMode:(TRequestMode)mode;

@end
