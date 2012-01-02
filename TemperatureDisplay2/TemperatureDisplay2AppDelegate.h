//
//  TemperatureDisplay2AppDelegate.h
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "TemperatureController.h"

@interface TemperatureDisplay2AppDelegate : NSObject <NSApplicationDelegate> {
    TemperatureController *viewController;
}

@property (assign) IBOutlet TemperatureController *viewController;

@end
