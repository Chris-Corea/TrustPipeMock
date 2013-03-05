//
//  ViewController.h
//  TrustPipeMockUIWithDelegate
//
//  Created by Christopher Corea on 3/4/13.
//  Copyright (c) 2013 Senior Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceStarter.h"

@interface ViewController : UIViewController <ServiceStarterDelegate>

@property (retain, nonatomic) UITextField *textField;

- (void)addImageToView;
- (void)addStartButton;
- (void)addTextField;

@end
