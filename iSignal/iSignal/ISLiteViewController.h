//
//  ISLiteViewController.h
//  iSignal
//
//  Created by Patrick Deng on 11-8-21.
//  Copyright 2011年 CodeAnimal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ISUIUtils.h"

#import "ISCallbackDelegate.h"

@interface ISLiteViewController : UIViewController <ISCallbackDelegate>
{
    UIButton *helpButton;
    UIButton *configButton;
}
@property (nonatomic, retain) IBOutlet UIButton *configButton;

@property (nonatomic, retain) IBOutlet UIButton *helpButton;

-(IBAction) switchToHelpView:(id) sender;
-(IBAction) switchToConfigView:(id) sender;

@end
