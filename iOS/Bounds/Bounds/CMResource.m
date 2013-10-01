//
//  CMRestModel.m
//  Bounds
//
//  Created by Craig McNamara on 1/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMResource.h"
#import "CMApiController.h"

@interface CMResource ()
@end

@implementation CMResource

+ (id)createWithData:(NSDictionary *)data
{
    id resource = [[self.class alloc] init];
    NSMutableDictionary *mutableData = [[NSMutableDictionary alloc] initWithDictionary:data];
    [resource setData:mutableData];
    return resource;
}

- (void)save:(void (^)())success {
    
    if([self.data objectForKey:@"id"]) {
        NSString *path = [self.class path];
        path = [path stringByAppendingFormat:@"/%@", self.data[@"id"]];
        
        [[CMApiController httpClient] putPath:path parameters:self.data success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success();
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"PUT save faile! OH NO! %@ %@", error.description, self.data);
        }];
    } else {
        // Saving a new resource
        [[CMApiController httpClient] postPath:[self.class path] parameters:self.data success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success();
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"POST save faile! OH NO! %@ %@", error.description, self.data);
        }];
    }
}

+ (void)getWithID:(int)resourceId success:(void (^)(id resource))success {
    
    NSString *path = [self.class path];
    path = [path stringByAppendingFormat:@"/%d", resourceId];
    
    [[CMApiController httpClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success([self.class createWithData:responseObject]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"such a failure!!! %@", error);
    }];
}

+ (void)queryWithParameters:(NSDictionary *)parameters success:(void (^)(NSMutableArray *resources))success {
    
    NSLog(@"Querying with aprameters");
    [[CMApiController httpClient] getPath:[self.class path] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *responses = [NSMutableArray arrayWithCapacity:[responseObject count]];
        
        NSLog(@"Server response %@", responses);
        for(NSDictionary *data in responseObject) {
            [responses  addObject:[self.class createWithData:data]];
//            NSLog(@"Response %@", data);
        }
    
        success(responses);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"such a failure with query!!! %@", error.description);
    }];
    
}

+ (NSString *)path {
    return @"api";
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Type:%@, Data: %@", [self.class path], self.data];
}

@end
