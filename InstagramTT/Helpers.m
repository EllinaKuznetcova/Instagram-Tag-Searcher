//
//  Helpers.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 17.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helpers.h"
#import "PostSearchView.h"

@implementation Helpers

-(void) PresentViewController: (UIViewController*) controller animated:(BOOL) isAnimated {
    
}

+(void) showLoginController {
    UIViewController* controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    [[[UIApplication sharedApplication] delegate] window].rootViewController = controller;
}

+(void) showPostSearchController {
    UIViewController* controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier: [PostSearchView identifier]];
    [[[UIApplication sharedApplication] delegate] window].rootViewController = controller;
}

@end
