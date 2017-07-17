//
//  AppDelegate.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "AppDelegate.h"
#import "InstagramService.h"
#import "Helpers.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([[[InstagramService alloc] init] isAuthorized]) {
        [Helpers showPostSearchController];
    } else {
        [Helpers showLoginController];
    }
    
    return YES;
}

@end
