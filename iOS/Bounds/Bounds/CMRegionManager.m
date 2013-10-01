//
//  CMRegionManager.m
//  Bounds
//
//  Created by Craig McNamara on 1/10/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMRegionManager.h"

@implementation CMRegionManager

+ (CMRegionManager *)regionManager
{
    static CMRegionManager *instance;
    if (!instance) {
        // Make sure we have a AFHttpClient before anybody tries to use the API.
        instance = [[CMRegionManager alloc] init];
    }
    return instance;
}


@end
