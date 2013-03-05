//
//  ViewController.m
//  TrustPipeMockUIWithDelegate
//
//  Created by Christopher Corea on 3/4/13.
//  Copyright (c) 2013 Senior Team. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)startService:(id)sender;
@end

@implementation ViewController

@synthesize textField= _textField;

- (void)loadView
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    UIView *myView = [[UIView alloc] initWithFrame:rect];
    [myView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [myView setAutoresizesSubviews:YES];
    [myView setBackgroundColor:[UIColor blackColor]];
    [self setView:myView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self addImageToView];
    [self addStartButton];
    [self addTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addImageToView
{
    UIImage *tpImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"header" ofType:@"png"]];
    UIImageView *tpImageView = [[UIImageView alloc] initWithImage:tpImage];
    CGSize boundsSize = self.view.bounds.size;
    CGRect frameToCenter = tpImageView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    // adding a bit of a top buffer manually
    frameToCenter.origin.y = 50;
    
    tpImageView.frame = frameToCenter;
    [self.view addSubview:tpImageView];
}

- (void)addStartButton
{
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(self.view.center.x/2, 330.0, 170.0, 50.0);
    startButton.backgroundColor = [UIColor clearColor];
    startButton.accessibilityIdentifier = @"start button";
    [startButton setTitle:@"Start TrustPipe" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startService:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
}

// text field will only show text while trustpipe is running
- (void)addTextField
{
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x/2, 270.0, 170.0, 30.0)];
    [self.textField setTextAlignment:NSTextAlignmentCenter];
    [self.textField setTextColor:[UIColor redColor]];
    [self.textField setBackgroundColor:[UIColor blackColor]];
    [self.textField setUserInteractionEnabled:NO];
    [self.textField setEnabled:NO];
    [self.view addSubview:self.textField];
}

- (void)startService:(id)sender
{
    ServiceStarter *ss = [[ServiceStarter alloc] init];
    [ss setDelegate:self];
    [ss startService];
}

#pragma mark - Actions

- (void)serviceStartedSuccessfully:(ServiceStarter *)starter
{
    [self.textField setText:@"TrustPipe has started"];
}

@end
