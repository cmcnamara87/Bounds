//
//  CMUserResource.h
//  Bounds
//
//  Created by Craig McNamara on 15/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMResource.h"

@interface CMUserResource : CMResource
+ (void)loginWithUsername:(NSString*)username password:(NSString *)password success:(void (^)(CMUserResource *user))success;
@end
