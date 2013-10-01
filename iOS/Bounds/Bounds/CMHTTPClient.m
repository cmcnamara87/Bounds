//
//  CMHTTPClient.m
//  Bounds
//
//  Created by Michael O'Brien on 1/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMHTTPClient.h"
#import "AFHTTPClient.h"

static const CGFloat kDefaultTimeoutInterval = 30.0f;

@implementation CMHTTPClient

+ (CMHTTPClient *)httpClientWithBaseURL:(NSString *)baseURL
{
    return [[CMHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
}

//Pre-configured for JSON with a default timeout interval
- (id)initWithBaseURL:(NSURL *)url
{
    if ((self = [super initWithBaseURL:url]))
    {
        _timeoutInterval = kDefaultTimeoutInterval;
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
//        [self setParameterEncoding:AFFormURLParameterEncoding];
//        [self setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self setStringEncoding:NSUTF8StringEncoding];
        [[self operationQueue] setMaxConcurrentOperationCount:15];
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        self.parameterEncoding = AFJSONParameterEncoding;

//        [self setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            if (status == AFNetworkReachabilityStatusNotReachable) {
//                // Not reachable
//            } else {
//                // Reachable
//            }
//            
//            if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
//                // On wifi
//            }
//        }];
        
        

    }
    return self;
}

//Overriding this method to have more control over caching + timeout interval for test environments
- (NSMutableURLRequest *)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *urlReq = [super requestWithMethod:method path:path parameters:parameters];
    [urlReq setTimeoutInterval:40.0f];
    [urlReq setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    [urlReq setHTTPShouldHandleCookies:YES];
    [urlReq setHTTPShouldUsePipelining:YES];
    [urlReq setTimeoutInterval:_timeoutInterval];
    return urlReq;
}

@end
