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
        
        NSURL *url = [[NSURL alloc] initWithString:@"http://itunes.apple.com/search?term=harry&country=us&entity=movie"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        AFHTTPRequestOperation *test = [AFHTTPRequestOperation json]
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSLog(@"%@", JSON);
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
        }];
        [operation start];
        
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
