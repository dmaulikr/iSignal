//
//  ISMapAnnotation.m
//  iSignal
//
//  Created by Patrick Deng on 12-2-18.
//  Copyright (c) 2012年 CodeBeaver. All rights reserved.
//

#import "ISMapAnnotation.h"

@implementation ISMapAnnotation

@synthesize image;
@synthesize latitude;
@synthesize longitude;

@synthesize title;
@synthesize subtitle;

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [self.latitude doubleValue];
    theCoordinate.longitude = [self.longitude doubleValue];
    return theCoordinate; 
}

- (void)dealloc
{
    [self.image release];
    
    [self.title release];
    [self.subtitle release];
    
    [super dealloc];
}

@end
