//
//  JKView.m
//  Nov29
//
//  Created by Jayesh Kataria on 12/17/12.
//  Copyright (c) 2012 Jayesh Kataria. All rights reserved.
//

#import "JKView.h"

@implementation JKView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// Initialization code
		self.backgroundColor = [UIColor lightGrayColor];
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
		//Center the button in the view.
		CGSize s = CGSizeMake(200, 40);	//size of button
		CGRect b = self.bounds;
        
		button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width) / 2,
                                  b.origin.y + (b.size.height - s.height) / 2,
                                  s.width,
                                  s.height
                                  );
        
		[button setTitleColor: [UIColor redColor]
                     forState: UIControlStateNormal];
        
		[button setTitle: @"Play Tom & Jerry!!!"
                forState: UIControlStateNormal];
        
		[button addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
		
		[self addSubview: button];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) reCenterButton{
    CGSize s = CGSizeMake(200, 40);	//size of button
    CGRect b = self.bounds;
    button.frame = CGRectMake(
                              b.origin.x + (b.size.width - s.width) / 2,
                              b.origin.y + (b.size.height - s.height) / 2,
                              s.width,
                              s.height
                              );
}


@end
