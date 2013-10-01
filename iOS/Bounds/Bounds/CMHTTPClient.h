//
//  CMHTTPClient.h
//  Bounds
//
//  Created by Michael O'Brien on 1/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CMHTTPClient : AFHTTPClient
@property (nonatomic, unsafe_unretained) CGFloat timeoutInterval;
+ (CMHTTPClient *)httpClientWithBaseURL:(NSString *)baseURL;
@end
