//
//  StatusBar.m
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import "StatusBar.h"

@implementation StatusBar

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)awakeFromNib{
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
    [statusItem setTitle:@"Status"];
}

@end
