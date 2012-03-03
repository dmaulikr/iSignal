//
//  ISAudioModule.h
//  iSignal
//
//  Created by Patrick Deng on 12-3-2.
//  Copyright (c) 2012年 CodeBeaver. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBModuleAbstractImpl.h"

#import "CBAVManager.h"

#define MODULE_IDENTITY_AUDIO_MODULE @"AudioModule"

#define AUDIO_NO_SIGNAL @"signalLost"

#define AUDIO_TYPE_CAF @"caf"

@interface ISAudioModule : CBModuleAbstractImpl

@property (nonatomic, retain, readonly) CBAVManager *audioManager;

@end