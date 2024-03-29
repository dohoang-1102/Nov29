//
//  JKAppDelegate.m
//  Nov29
//
//  Created by Jayesh Kataria on 12/17/12.
//  Copyright (c) 2012 Jayesh Kataria. All rights reserved.
//

#import "JKAppDelegate.h"
#import "JKView.h"
#import "JKViewController.h"

@implementation JKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Override point for customization after application launch.
	NSBundle *bundle = [NSBundle mainBundle];
	if (bundle == nil) {
		NSLog(@"Could not access main bundle.");
		return YES;
	}
    
	NSString *filename = [bundle pathForResource: @"TomAndJerry" ofType: @"mp4"];
	if (filename == nil) {
		NSLog(@"could not find file sneeze.m4v");
		return YES;
	}
    
	NSURL *url = [NSURL fileURLWithPath: filename];
	if (url == nil) {
		NSLog(@"could not create URL for file %@", filename);
		return YES;
	}
    
	controller = [[MPMoviePlayerController alloc] init];
	if (controller == nil) {
		NSLog(@"could not create MPMoviePlayerController");
		return YES;
	}
    
	controller.shouldAutoplay = NO; //don't start spontaneously
	controller.scalingMode = MPMovieScalingModeNone;
	controller.controlStyle = MPMovieControlStyleFullscreen;
	controller.movieSourceType = MPMovieSourceTypeFile; //vs. stream
//    controller.
	[controller setContentURL: url];
//    [controller allow]
    
	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	
	[center
     addObserver: self
     selector: @selector(playbackDidFinish:)
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: controller
     ];
    
	UIScreen *screen = [UIScreen mainScreen];
	view = [[JKView alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	//self.window.backgroundColor = [UIColor whiteColor];
    
    vc = [[JKViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = vc;
    vc.view = view;
	//[self.window addSubview: view];
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark Application delegate is target of button.

- (void) touchUpInside: (id) sender {
	//sender is the button.
	controller.view.frame = view.frame;
	[view removeFromSuperview];
	[self.window addSubview: controller.view];
//    [[controller view] setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
//    [[controller view] setTransform:CGAffineTransformConcat([controller view].transform,CGAffineTransformMakeScale(1.7, 0.7))];
	[controller play];
}

#pragma mark -
#pragma mark Application delegate is observer of MPMoviePlayerController.

- (void) playbackDidFinish: (NSNotification *) notification {
	//notification.object is the movie player controller.
	[controller.view removeFromSuperview];
	[UIApplication sharedApplication].statusBarHidden = NO;
	[self.window addSubview: view];
}


@end
