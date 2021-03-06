/*
 * LipikaIME is a user-configurable phonetic Input Method Engine for Mac OS X.
 * Copyright (C) 2013 Ranganath Atreya
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

#import <InputMethodKit/InputMethodKit.h>
#import "DJLipikaClientDelegate.h"

@interface DJLipikaCandidates : NSObject {
    DJLipikaClientDelegate *client;
    NSArray *currentCandidates;
}

-(id)initWithClient:(DJLipikaClientDelegate *)theClient;
-(void)showCandidateWithInput:(NSString *)input output:(NSString *)output replacementLength:(unsigned long)replacementLength;
-(NSArray *)candidates;
-(void)hide;

@end
