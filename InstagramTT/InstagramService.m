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
    InstagramKitLoginScope scope = InstagramKitLoginScopePublicContent;
    return [[InstagramEngine sharedEngine] authorizationURLForScope:scope];
}

-(BOOL) checkTokenAndSaveFromURL:(NSURL *)url error:(NSError *__autoreleasing *)error {
    return [[InstagramEngine sharedEngine] receivedValidAccessTokenFromURL:url error:error];
}

-(void)searchPostsByTag:(NSString*)tagText withSuccess:(void (^)(NSArray<InstaPost *> *posts))successBlock
                failure:(void (^) (NSError* error, NSInteger serverStatusCode))failureBlock {
    
    [[InstagramEngine sharedEngine] getMediaWithTagName:tagText withSuccess:^(NSArray<InstagramMedia *> * _Nonnull media, InstagramPaginationInfo * _Nonnull paginationInfo) {
        NSMutableArray<InstaPost *> *posts = [NSMutableArray arrayWithCapacity: media.count];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (InstagramMedia* mediaObject in media) {
                InstaPost* post = [[InstaPost alloc] init];
                post.imageLink = mediaObject.standardResolutionImageURL;
                post.imageSize = mediaObject.standardResolutionImageFrameSize;
                post.likesCount = mediaObject.likesCount;
                post.comment = mediaObject.caption.text;
                [posts addObject:post];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock(posts);
            });
        });
    } failure:^(NSError * _Nonnull error, NSInteger serverStatusCode) {
        failureBlock(error, serverStatusCode);
    }];
}

@end
