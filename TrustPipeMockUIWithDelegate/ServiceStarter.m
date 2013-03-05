//
//  ServiceStarter.m
//  TrustPipeMockUIWithDelegate
//
//  Created by Christopher Corea on 3/4/13.
//  Copyright (c) 2013 Senior Team. All rights reserved.
//

#import "ServiceStarter.h"

@implementation ServiceStarter
@synthesize delegate = _delegate;

- (void)backgroundTask
{
    NSLog(@"Background task worked! Thread name = %@", [NSThread currentThread]);
    [self.delegate serviceStartedSuccessfully:self];
}

- (void)startService
{
    NSLog(@"call to start background process from: %@", [NSThread currentThread]);
    [self performSelectorInBackground:@selector(backgroundTask) withObject:self];
}

@end
