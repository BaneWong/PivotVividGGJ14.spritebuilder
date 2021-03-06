//
//  GroundBlock64.m
//  PivotVividGGJ14
//
//  Created by Benjamin Encz on 25/01/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GroundBlock64.h"
#import "Mood.h"

@implementation GroundBlock64 {
}

- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"ground";
    
//    CC
//    
//    CCActionFadeTo *fade = [CCActionFadeTo actionWithDuration:0.1f opacity:0.7f];
//    CCActionReverse *reverse = [CCActionReverse actionWithAction:fade];
//    CCActionSequence *seq = [CCActionSequence actions:fade, reverse, nil];
//    _warn = [CCActionRepeatForever actionWithAction:seq];
}

- (void)applyMood:(Mood*)newMood {
    
    NSString *spriteFrameName = [NSString stringWithFormat:@"art/%@_blocksmall.png", newMood.moodPrefix];
    
    if (self.onlyVisibleInMood) {
        if ([newMood.moodPrefix isEqualToString:self.onlyVisibleInMood]) {
            self.physicsBody.collisionMask = nil;
            self.opacity = 1.f;
        } else {
            self.physicsBody.collisionMask = @[];
            self.opacity = 0.4f;
            spriteFrameName = [NSString stringWithFormat:@"art/%@_blocksmall.png", _onlyVisibleInMood];
        }
    }
    
    CCSpriteFrame* spriteFrame = [CCSpriteFrame frameWithImageNamed:spriteFrameName];
    
    [self setSpriteFrame:spriteFrame];
}

@end