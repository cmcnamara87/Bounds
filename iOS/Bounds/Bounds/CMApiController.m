//
//  BiTApiController.m
//  BestInTown
//
//  Created by Justin Marrington on 14/04/12.
//  Copyright (c) 2012 University of Queensland. All rights reserved.
//

#import "CMApiController.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface CMApiController ()
@property (nonatomic, strong) CMHTTPClient *httpClient;
@end

@implementation CMApiController
@synthesize httpClient;

+ (CMApiController *)sharedAPI
{
    static id shared_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared_ = [[[self class] alloc] init];
    });
    return shared_;
}

- (id)init
{
    if ((self = [super init]))
    {
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        httpClient = [CMHTTPClient httpClientWithBaseURL:@"http://craigmcnamara.com/bounds/test/"];
    }
    return self;
}

+ (CMHTTPClient *)httpClient
{
    return [self sharedAPI].httpClient;
}
//
//
//- (void)getPath:(NSString *)path 
//     parameters:(NSDictionary *)parameters
//      OnSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure 
//{
//    
//    NSLog(@"URL %@", path);
//    NSLog(@"Params: %@", parameters);
//    [httpClient getPath:path parameters:parameters success:success failure:failure];
//}
//
//- (void)postPath:(NSString *)path 
//      parameters:(NSDictionary *)parameters 
//       OnSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//{
//    NSLog(@"URL %@", path);
//    NSLog(@"Params: %@", parameters);
//    [httpClient postPath:path parameters:parameters success:success failure:failure];
//}
//
///**
//    Get all the categories
// */
//- (void)getCategoriesOnSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//{
//    [httpClient getPath:@"/api/categories" parameters:nil success:success failure:failure];
//}
//
///** 
//    Get the top ten list for a category and city
// */
//- (void)getBusinessListForCategory:(NSString *)categoryId 
//                            inCity:(NSString *)cityId
//                         onSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//{
//    NSString *apiPath = [NSString stringWithFormat:@"/api/topten/category/%@/cityid/%@", categoryId, cityId];
//    NSLog(@"apiPath: http://bestintown.co%@", apiPath);
//    [httpClient getPath:apiPath parameters:nil success:success failure:failure];
//}

@end
