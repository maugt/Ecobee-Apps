//
//  TemperatureController.h
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SBJson/SBJson.h>

@interface TemperatureController : NSViewController {
    // Add IBOutlets for the things we want to interact with
    
   // NSWindow *window;
    NSTimer *timer;
    
    NSURLConnection *theConnection;
    SBJsonStreamParser *parser;
    SBJsonStreamParserAdapter *adapter;
}

@property (assign) IBOutlet NSWindow *window;
- (IBAction)updateTemp;

@end
