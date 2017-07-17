//
//  InstagramService.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "InstagramService.h"

@import InstagramKit;

@implementation InstagramService

-(BOOL) isAuthorized {
    return [[InstagramEngine sharedEngine] isSessionValid];
}

-(NSURL*) authorizationURL {
    return [[InstagramEngine sharedEngine] authorizationURL];
}

-(BOOL) checkTokenAndSaveFromURL:(NSURL *)url error:(NSError *__autoreleasing *)error {
    return [[InstagramEngine sharedEngine] receivedValidAccessTokenFromURL:url error:error];
}

@end
