//
//  ISHelpViewNavigationController.m
//  iSignal
//
//  Created by Patrick Deng on 12-3-16.
//  Copyright (c) 2012年 CodeBeaver. All rights reserved.
//

#import "ISHelpViewNavigationController.h"

@implementation ISHelpViewNavigationController

- (void)initTabBarItem
{
    UIImage* itemImage = [UIImage imageNamed:@"tab_help.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"STR_TAB_HELP", nil) image:itemImage tag:TABVIEW_INDEX_HELPVIEW];
    self.tabBarItem = theItem;
    [theItem release];    
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self initTabBarItem];
    }
    return self;
}

- (void)dealloc 
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationBarHidden:TRUE];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

@end