//
//  TemperatureController.m
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import "TemperatureController.h"


@interface TemperatureController() <SBJsonStreamParserAdapterDelegate>
@end



@implementation TemperatureController 

//@synthesize window;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        timer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(redraw) userInfo:nil repeats:YES];
    }
    
    return self;
}

-(void) redraw {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshView" object:nil];
}

- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray*)array
{
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary*)dict
{
}

- (IBAction)updateTemp {

    adapter = [[SBJsonStreamParserAdapter alloc] init];
    parser = [[SBJsonStreamParser alloc] init];
    
    NSString *registerUrl = @"https://www.ecobee.com/home/ecobee/register";
    

    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:registerUrl]
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"Connection didReceiveData of length: %lu", data.length);
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSLog(@"Connection didReceiveAuthenticationChallenge: %@", challenge);
}

@end
