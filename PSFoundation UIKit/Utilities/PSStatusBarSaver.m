//
//  PSStatusBarSaver.m
//  PSFoundation
//
//  Created by Peter Steinberger on 21.11.10.
//  Copyright 2010 Peter Steinberger. All rights reserved.
//

#import "PSStatusBarSaver.h"


@implementation PSStatusBarSaver

@synthesize savedStatusBarStyle = savedStatusBarStyle_;

SYNTHESIZE_SINGLETON_FOR_CLASS(PSStatusBarSaver);

+ (PSStatusBarSaver *)sharedStatusBarSaver {
    return [PSStatusBarSaver sharedInstance];
}

- (id)init {
  if ((self = [super init])) {
      [[self class] captureStatusBar];
  }
  return self;
}

+ (void)captureStatusBarAndSetTo:(UIStatusBarStyle)newStyle {
  [self captureStatusBarAndSetTo:newStyle animated:YES];
}

+ (void)captureStatusBarAndSetTo:(UIStatusBarStyle)newStyle animated:(BOOL)animated {
  [self captureStatusBar];
  [[UIApplication sharedApplication] setStatusBarStyle:newStyle animated:animated];
}

+ (void)captureStatusBar {
  UIStatusBarStyle savedStyle = [UIApplication sharedApplication].statusBarStyle;
  [self sharedStatusBarSaver].savedStatusBarStyle = savedStyle;
}

+ (void)restoreStatusBar {
  [self restoreStatusBarAnimated:YES];
}

+ (void)restoreStatusBarAnimated:(BOOL)animated {
  UIStatusBarStyle restoreStyle = [self sharedStatusBarSaver].savedStatusBarStyle;
  [[UIApplication sharedApplication] setStatusBarStyle:restoreStyle animated:animated];
}

@end