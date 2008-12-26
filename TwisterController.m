//
//  TwisterController.m
//  Twister
//
//  Created by Dustin Sallings on 2008/12/25.
//  Copyright 2008 Dustin Sallings <dustin@spy.net>. All rights reserved.
//

#import "TwisterController.h"
#import "NSArray+RandomChoice.h"

@implementation TwisterController

-(void)setAnImage:(NSImageView *)v to:(NSString *)n {
    NSImage *imageFromBundle = [NSImage imageNamed:[NSString stringWithFormat:@"%@.gif", n]];
    [v setImage: imageFromBundle];
}

-(void)newCall:(id) sender {
    NSString *limb=[limbs choice];
    NSString *color=[colors choice];

    NSLog(@"Limb:  %@", limb);
    NSLog(@"Color:  %@", color);

    [synth stopSpeaking];
    [synth startSpeakingString:[NSString stringWithFormat:@"%@ %@", limb, color]];

    [self setAnImage:leftPane to:limb];
    [self setAnImage:rightPane to:color];
}

-(void)toggleState:(id)sender {
    if(timer == nil) {
        int delay=[defaults integerForKey:@"delay"];
        timer = [NSTimer scheduledTimerWithTimeInterval:delay
            target:self
            selector:@selector(newCall:)
            userInfo:nil
            repeats:YES];
        [startStopButton setTitle:@"Stop"];
        [self newCall:nil];
    } else {
        [timer invalidate];
        timer=nil;
        [leftPane setImage:nil];
        [rightPane setImage:nil];
        [startStopButton setTitle:@"Start"];
    }
}

-(void)awakeFromNib {
    NSLog(@"Hello!");
    limbs = [[NSArray arrayWithObjects: @"Left Foot", @"Right Foot", @"Left Hand", @"Right Hand", nil] retain];
    colors = [[NSArray arrayWithObjects: @"Blue", @"Green", @"Red", @"Yellow", nil] retain];

    defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt:5], @"delay",
        nil]];

    NSLog(@"Limbs:  %@", limbs);
    NSLog(@"Colors:  %@", colors);

    synth=[[NSSpeechSynthesizer alloc] init];

    timer = nil;
}

@end
