//
//  MyClass.h
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TemperatureView : NSView {
    NSString* currentTemp;
    NSTimer *timer;
}

NSString* runScript();

@end
