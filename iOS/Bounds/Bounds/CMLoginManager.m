//
//  CMUserManager.m
//  Bounds
//
//  Created by Craig McNamara on 1/10/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMLoginManager.h"
#import "CMApiController.h"
#import "CMUserResource.h"

@interface CMLoginManager()
@property (nonatomic, strong) CMUserResource *user;
@end

@implementation CMLoginManager

+ (CMLoginManager *)loginManager
{
    static CMLoginManager *instance;
    if (!instance) {
        // Make sure we have a AFHttpClient before anybody tries to use the API.
        instance = [[CMLoginManager alloc] init];
    }
    return instance;
}

- (CMUserResource *)currentUser {
//    if(!self.user) {
//        // no user stored currently, check nsuserdefaults
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        NSDictionary *storedUser = [defaults objectForKey:@"user"];
//        if(storedUser) {
//            self.user = [CMUserResource createWithData:storedUser];
//            NSLog(@"Current user is '%@'", [storedUser objectForKey:@"name"]);
//        }
//    }
    
    return self.user;
}

- (void)setCurrentUser:(CMUserResource *)currentUser {
    self.user = currentUser;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *userData = currentUser.data;
    
    [userData removeObjectForKey:@"rdf_mapping"];
    [userData removeObjectForKey:@"picture"];
    
    NSLog(@"user data %@", userData);
    [defaults setObject:[userData copy] forKey:@"user"];
    [defaults synchronize];
}



@end
