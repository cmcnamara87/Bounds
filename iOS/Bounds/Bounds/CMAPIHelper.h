//
//  CMAPIHelper.h
//  Bounds
//
//  Created by Michael O'Brien on 1/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import <Foundation/Foundation.h>

//Nicer completion blocks - can be returned by selectors
typedef void (^AFRequestCompletionSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^AFRequestCompletionFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);
