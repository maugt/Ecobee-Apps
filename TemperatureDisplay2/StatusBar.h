//
//  StatusBar.h
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusBar : NSObject {
    IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
}

@end
