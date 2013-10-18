//
//  Oct17AppDelegate.h
//  Oct17
//
//  Created by Dimitri Vishnepolsky on 10/17/13.
//  Copyright (c) 2013 dImo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Oct17AppDelegate: UIResponder <UIApplicationDelegate>  {
	View *view;
}

@property (strong, nonatomic) UIWindow *window;
@end