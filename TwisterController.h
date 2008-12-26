//
//  TwisterController.h
//  Twister
//
//  Created by Dustin Sallings on 2008/12/25.
//  Copyright 2008 Dustin Sallings <dustin@spy.net>. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TwisterController : NSWindowController {
    IBOutlet NSImageView *leftPane;
    IBOutlet NSImageView *rightPane;
    IBOutlet NSButton *startStopButton;

    NSUserDefaults *defaults;
    NSTimer *timer;
    NSArray *limbs;
    NSArray *colors;

    NSSpeechSynthesizer *synth;
}

-(void)toggleState:(id)sender;

@end
