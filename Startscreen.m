//
//  Startscreen.m
//  PivotVividGGJ14
//
//  Created by Benjamin Encz on 26/01/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Startscreen.h"

@implementation Startscreen {
    CCLabelTTF *_label;
    CCNode *_backgroundImage;
}

- (void)didLoadFromCCB {
    // preload audio
    _label.string = @"Loading Resources ...";
    [self performSelectorInBackground:@selector(preloadAudio) withObject:nil];
}

- (void)preloadAudio {
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    audio.preloadCacheEnabled = TRUE;
    
    NSArray *emotions = @[@"happy", @"angry",@"calm", @"fear"];
    
    for (NSString *title in emotions) {
        NSString *filename = [NSString stringWithFormat:@"%@.mp3", title];
        [audio preloadEffect:filename];
    }
    
    [self performSelectorOnMainThread:@selector(loadCompleted) withObject:nil waitUntilDone:FALSE];
}

- (void)loadCompleted {
    _label.string = @"#GGJ14";
    
    CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:0.4f];
    [_label runAction:fadeOut];
    
    CCActionFadeIn *fadeIn = [CCActionFadeIn actionWithDuration:0.4f];
    [_backgroundImage runAction:fadeIn];
}

- (void)startNow {
    CCScene *scene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void)levelSelect {
    CCScene *scene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:scene];
}

@end
