//
//  ISDummnyTelephony.h
//  iSignal
//
//  Created by Patrick Deng on 11-8-23.
//  Copyright 2011年 CodeAnimal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/NSArray.h>

#import "ISCallbackDelegate.h"

#define CARRIER_CMCC 0;
#define CARRIER_CUNI 1;

#define CELLULAR_SIGNAL_STRENGTH_HIGHEST -50;
#define CELLULAR_SIGNAL_STRENGTH_LOWEST -110;

@interface ISDummnyTelephony : NSObject
{
    id<ISCallbackDelegate> callbackDelegate;
    NSArray *carrierArray;
}

@property (nonatomic, retain) id<ISCallbackDelegate> callbackDelegate; 
@property (nonatomic, retain) NSArray *carrierArray;

-(NSString*) randomCarrier;
-(NSInteger) randomCellularSignalStrength;

@end