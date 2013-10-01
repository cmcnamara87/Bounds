//
//  BiTApiController.h
//  BestInTown
//
//  Created by Justin Marrington on 14/04/12.
//  Copyright (c) 2012 University of Queensland. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CMHTTPClient.h"

#define kApiBase @"http://localhost:8888/drupal/api/"
#define kApiBaseUni @"http://10.0.2.35:8888/"
#define kApiBaseOnline @"http://bestintown.co/v2/"
#define kBrisbaneCityId @"1213";

@interface CMApiController : NSObject
+ (CMApiController *)sharedAPI;
+ (CMHTTPClient *)httpClient;

//
//- (void)getCategoriesOnSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
//
//- (void)getBusinessListForCategory:(NSString *)categoryId 
//                            inCity:(NSString *)cityId
//                         onSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
//
//
//- (void)getPath:(NSString *)path 
//     parameters:(NSDictionary *)parameters
//      OnSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
//
//- (void)postPath:(NSString *)path 
//      parameters:(NSDictionary *)parameters 
//       OnSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success 
//         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
