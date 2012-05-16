//
//  MapPointAnnotion.h
//  txtw
//
//  Created by jian zhang on 12-4-10.
//  Copyright (c) 2012年 txtw.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface MapPointAnnotion : BMKPointAnnotation
{
    int tag;
    NSString* description;
}
@property(nonatomic,assign)int tag;
@property(nonatomic,copy)NSString* description;

@end
