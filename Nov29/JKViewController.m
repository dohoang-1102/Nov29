//
//  JKViewController.m
//  Nov29
//
//  Created by Jayesh Kataria on 12/17/12.
//  Copyright (c) 2012 Jayesh Kataria. All rights reserved.
//

#import "JKViewController.h"
#import "JKView.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

JKView *vw;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    vw = (JKView*) self.view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    [(JKView*) self.view reCenterButton];
}

@end
