//
//  CMResource.h
//  Bounds
//
//  Created by Craig McNamara on 1/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kApi @"test"

@interface CMResource : NSObject

+ (void)queryWithParameters:(NSDictionary *)parameters success:(void (^)(NSMutableArray *resources))success;
+ (void)getWithID:(int)resourceId success:(void (^)(id resource))success;
+ (id)createWithData:(NSDictionary *)data;
- (void)save:(void (^)())success;


@property (nonatomic, strong) NSMutableDictionary *data;

@end
