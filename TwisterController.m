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

    [self setAnImage:leftPane to:limb];
    [self setAnImage:rightPane to:color];
}

-(void)awakeFromNib {
    NSLog(@"Hello!");
    limbs = [[NSArray arrayWithObjects: @"Left Foot", @"Right Foot", @"Left Hand", @"Right Hand", nil] retain];
    colors = [[NSArray arrayWithObjects: @"Blue", @"Green", @"Red", @"Yellow", nil] retain];

    NSLog(@"Limbs:  %@", limbs);
    NSLog(@"Colors:  %@", colors);

   timer = [NSTimer scheduledTimerWithTimeInterval:5.0
        target:self
        selector:@selector(newCall:)
        userInfo:nil
        repeats:YES];
}

@end
