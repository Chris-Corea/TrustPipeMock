//
//  ServiceStarter.h
//  TrustPipeMockUIWithDelegate
//
//  Created by Christopher Corea on 3/4/13.
//  Copyright (c) 2013 Senior Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ServiceStarter;

@protocol ServiceStarterDelegate <NSObject>
- (void)serviceStartedSuccessfully:(ServiceStarter *)starter;
@end

@interface ServiceStarter : NSObject

@property (weak, nonatomic) id <ServiceStarterDelegate> delegate;

- (void)backgroundTask;
- (void)startService;

@end
