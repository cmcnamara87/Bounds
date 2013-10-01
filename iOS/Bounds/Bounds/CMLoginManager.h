//
//  CMUserManager.h
//  Bounds
//
//  Created by Craig McNamara on 1/10/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMUserResource.h"

@interface CMLoginManager : NSObject
+ (CMLoginManager *)loginManager;
- (void)setCurrentUser:(CMUserResource *)currentUser;
- (CMUserResource *)currentUser;
@end
