//
//  View.m
//  Oct17
//
//  Created by Dimitri Vishnepolsky on 10/17/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect)rect
{
	// Drawing code
	NSString *string = NSLocalizedString(@"Greeting", @"displayed with drawAtPoint:");
	CGPoint point = CGPointMake(0.0, 0.0);
	UIFont *font = [UIFont systemFontOfSize: 32.0];
	[string drawAtPoint: point withFont: font];
    
    //Fill the Red Cross.
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
    
	CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
	CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
    
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGRect   vertical = CGRectMake(-shortSide / 2, -longSide / 2, shortSide, longSide);
	CGContextAddRect(c, horizontal);
	CGContextAddRect(c, vertical);
    
	CGContextSetRGBFillColor(c, 1.0, 0.4, 0.8, 1.0);
    
	//5 is the amount of blur.  A smaller number makes a sharper shadow.
    //Light source at upper left, shadow at lower right.
	CGSize shadow = CGSizeMake(10, -20);

    
	CGContextSetShadow(c, shadow, 5);
	CGContextFillPath(c);
}


@end
