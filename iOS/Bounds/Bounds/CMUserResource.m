//
//  CMUserResource.m
//  Bounds
//
//  Created by Craig McNamara on 15/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMUserResource.h"
#import "CMApiController.h"
#import "CMLoginManager.h"
#import "AFJSONRequestOperation.h"

@implementation CMUserResource


+ (NSString *)path {
    return @"user";
}

+ (void)loginWithUsername:(NSString*)username password:(NSString *)password success:(void (^)(CMUserResource *user))success {

    // Saving a new resource
    [[CMApiController httpClient] postPath:[NSString stringWithFormat:@"%@/%@/login" , kApi, [self.class path]] parameters:@{@"username": username, @"password": password} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        CMUserResource *user = [CMUserResource createWithData:[responseObject objectForKey:@"user"]];
        [[CMLoginManager loginManager] setCurrentUser:user];

        // Get the CSRF token
        [[CMApiController httpClient] getPath:@"services/session/token"
                                    parameters:@{}
                                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                           
                                           NSLog(@"\n\nToken is %@", responseObject);
////            success(user);
        
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"get failed user token! OH NO! %@ %@ %@", error.description, username, password);
        }];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"POST save faile! OH NO! %@ %@ %@", error.description, username, password);
    }];
}


@end
