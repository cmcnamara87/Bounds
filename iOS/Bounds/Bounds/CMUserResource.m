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

@implementation CMUserResource


+ (NSString *)path {
    return @"user";
}

+ (void)loginWithUsername:(NSString*)username password:(NSString *)password success:(void (^)(CMUserResource *user))success {

    // Saving a new resource
    [[CMApiController httpClient] postPath:[NSString stringWithFormat:@"%@/login" , [self.class path]] parameters:@{@"username": username, @"password": password} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        CMUserResource *user = [CMUserResource createWithData:[responseObject objectForKey:@"user"]];
        [[CMLoginManager loginManager] setCurrentUser:user];
        success(user);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"POST save faile! OH NO! %@ %@ %@", error.description, username, password);
    }];
}


@end
