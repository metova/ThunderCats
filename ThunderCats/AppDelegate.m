//
//  AppDelegate.m
//  ThunderCats
//
//  Created by lgauthier on 5/29/14.
//  Copyright (c) 2014 Metova. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "Thundercats.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    TableViewController *vc = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    
    self.window.rootViewController = vc;
    
    return YES;
}

@end
