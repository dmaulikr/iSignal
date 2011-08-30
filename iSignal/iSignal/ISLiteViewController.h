//
//  ISLiteViewController.h
//  iSignal
//
//  Created by Patrick Deng on 11-8-21.
//  Copyright 2011年 CodeAnimal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreFoundation/CoreFoundation.h>

#import "ISUIUtils.h"

#import "ISCallbackDelegate.h"
#import "ISDummyTelephony.h"
#import "ISTelephonyUtils.h"

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ISLiteViewController : UIViewController <ISCallbackDelegate>
{
    UILabel *signLabel;
    UILabel *unitLabel;
    UILabel *carrierLabel;
    UILabel *signalStrengthLabel;
    UILabel *qualityGradeLabel;
    
    AVAudioPlayer *audioPlayer;
    
    UIImageView *gradeIndicator01View;
    UIImageView *gradeIndicator02View;
    UIImageView *gradeIndicator03View;
    UIImageView *gradeIndicator04View;
    UIImageView *gradeIndicator05View;
}

@property (nonatomic, retain) IBOutlet UIImageView *gradeIndicator01View;
@property (nonatomic, retain) IBOutlet UIImageView *gradeIndicator02View;
@property (nonatomic, retain) IBOutlet UIImageView *gradeIndicator03View;
@property (nonatomic, retain) IBOutlet UIImageView *gradeIndicator04View;
@property (nonatomic, retain) IBOutlet UIImageView *gradeIndicator05View;

@property (nonatomic, retain) IBOutlet UILabel *qualityGradeLabel;
@property (nonatomic, retain) IBOutlet UILabel *signLabel;
@property (nonatomic, retain) IBOutlet UILabel *unitLabel;
@property (nonatomic, retain) IBOutlet UILabel *carrierLabel;
@property (nonatomic, retain) IBOutlet UILabel *signalStrengthLabel;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;


-(void) updateSignalStrength:(NSNumber*) signalVal;
-(void) updateCarrier:(NSString*) carrierStr;

@end
