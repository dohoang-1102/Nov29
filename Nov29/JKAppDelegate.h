//
//  JKAppDelegate.h
//  Nov29
//
//  Created by Jayesh Kataria on 12/17/12.
//  Copyright (c) 2012 Jayesh Kataria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@class JKView;
@class JKViewController;

@interface JKAppDelegate : UIResponder <UIApplicationDelegate>{
    MPMoviePlayerController *controller;
	JKView *view;
    JKViewController *vc;
}

@property (strong, nonatomic) UIWindow *window;

@end
