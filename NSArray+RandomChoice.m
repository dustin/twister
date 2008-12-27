//
//  NSArray+RandomChoice.m
//  Twister
//
//  Created by Dustin Sallings on 2008/12/25.
//  Copyright 2008 Dustin Sallings <dustin@spy.net>. All rights reserved.
//

#import "NSArray+RandomChoice.h"


@implementation NSArray (RandomChoice)

-(id)choice {
    int r=random() % [self count];
    return [self objectAtIndex:r];
}

@end
