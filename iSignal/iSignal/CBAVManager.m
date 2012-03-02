//
//  CBAVManager.m
//  iSignal
//
//  Created by Patrick Deng on 12-3-1.
//  Copyright (c) 2012年 CodeBeaver. All rights reserved.
//

#import "CBAVManager.h"

@implementation CBAVManager

@synthesize audioPlayer = _audioPlayer;

- (id)init
{
    self = [super init];
    if (self) 
    {
    }
    
    return self;
}

-(void) dealloc
{
    [_audioPlayer release];
    
    [super dealloc];
}

// Method of CBAVManager
-(void) audioSessionBegin
{    
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
    UInt32 doSetProperty = 1;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideCategoryMixWithOthers, sizeof(doSetProperty), &doSetProperty);
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
}

// Method of CBAVManager
-(void) audioSessionEnd
{
    [[AVAudioSession sharedInstance] setActive: FALSE error: nil];      
}

// Method of CBAVManager
-(BOOL) preparePlayAudio:(NSString*) resourcePath andResourceType:(NSString*) resourceType
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:resourcePath ofType:resourceType]; 
    NSURL *soundUrl = [[NSURL alloc] initFileURLWithPath:soundPath]; 
    if(![soundUrl checkResourceIsReachableAndReturnError:nil])
    {
        [soundUrl release];
        return FALSE;
    }
    
    if (_audioPlayer) 
    { 
        [_audioPlayer release]; 
    }
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil]; 
    
    [_audioPlayer prepareToPlay];      
    
    [soundUrl release];       
    
    return TRUE;
}

// Method of CBAVManager
-(void) playAudio
{
    [_audioPlayer play]; 
}

// Manual Codes End

@end
