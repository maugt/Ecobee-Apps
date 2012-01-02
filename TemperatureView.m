//
//  MyClass.m
//  TemperatureDisplay2
//
//  Created by Giles Douglas on 12/30/11.
//  Copyright 2011 Google, Inc. All rights reserved.
//

#import "TemperatureView.h"

@implementation TemperatureView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView:) name:@"refreshView" object:nil];
        
        currentTemp = runScript();
        // Initialization code here.
        timer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(redraw) userInfo:nil repeats:YES];
    }
    

    return self;
}

-(void) refreshView:(NSNotification*) notification {
    currentTemp = runScript();
    
    [self setNeedsDisplay:YES];
}

-(void) redraw {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshView" object:nil];
}


NSString *runScript()
{
    int filedes[2];
    if (pipe(filedes) == -1) {
        perror("pipe");
    }
    size_t bytesRead = 0;
    
    char buffer[1024];
    pid_t pid = fork();
    switch (pid) {
        default:
            close(filedes[1]);
        
            int stat;
            waitpid(-1, &stat, 0);
            bytesRead = read(filedes[0], buffer, 1024);
            if (bytesRead == -1) {
                perror("Failed to read");
            }
            break;
        case -1:
            NSLog(@"Failed to fork");
            break;
        case 0: // Child
            close(filedes[0]);
            int rval = dup2(filedes[1], 1);
            if (rval == -1) {
                perror("dup2 in child");
            }
            execl("/bin/sh", "/bin/sh", "/Users/giles/temp.sh", NULL);
            perror("Demo");
            exit(1);
    }
    
    
    NSString* string = [[NSString alloc] initWithCString:buffer length:bytesRead];
    NSLog (@"script returned: %@\n", string);  
    return string;
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSPoint point = NSMakePoint(0, 0);
    
    NSMutableDictionary *font_attributes = [[NSMutableDictionary alloc] init];
    NSFont *font = [NSFont fontWithName:@"Futura-Medium" size:42];
    [font_attributes setObject:font forKey:NSFontAttributeName];
    [currentTemp drawAtPoint:point withAttributes:font_attributes];
    
    [font_attributes release];
}



@end
