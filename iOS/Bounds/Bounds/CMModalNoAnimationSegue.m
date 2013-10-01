//
//  CMModalNoAnimationSegue.m
//  Bounds
//
//  Created by Craig McNamara on 23/09/13.
//  Copyright (c) 2013 Craig McNamara. All rights reserved.
//

#import "CMModalNoAnimationSegue.h"

@implementation CMModalNoAnimationSegue

- (void)perform
{
    [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];
}

@end
