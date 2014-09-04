//
//  SKAppDelegate.m
//  StockKing
//
//  Created by Ruthwick Pathireddy on 9/3/14.
//  Copyright (c) 2014 Darkking. All rights reserved.
//

#import "SKAppDelegate.h"
#import <Parse/Parse.h>

@implementation SKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Parse framework setup
    [Parse setApplicationId:@"GZzONDv6XzYF8cieYSQEmylZJRnr6qwcaX4seG1k"
                  clientKey:@"zfICzTs6PuUQRpxq0CJfjMDrLiqPbRo3x5T7ke0O"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}
							

@end
