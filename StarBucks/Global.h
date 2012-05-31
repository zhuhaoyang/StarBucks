//
//  Global.h
//  greenBerryReader
//
//  Created by haoyang zhu on 12-2-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject{

    NSMutableDictionary *dicShopCart;
    NSMutableArray *arrOrder;
}

@property(nonatomic,strong) NSMutableDictionary *dicShopCart;
@property(nonatomic,strong) NSMutableArray *arrOrder;
+ (Global *) sharedGlobal;

@end
