//
//  InstagramService.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InstaPost.h"

@protocol IInstagramService <NSObject>

@end

@interface InstagramService : NSObject<IInstagramService>

-(BOOL) isAuthorized;

-(BOOL) checkTokenAndSaveFromURL:(NSURL *)url
                           error:(NSError *__autoreleasing *)error;

-(NSURL*)authorizationURL;

-(void)searchPostsByTag:(NSString*)tagText
            withSuccess:(void (^)(NSArray<InstaPost *> *posts))successBlock
                failure:(void (^) (NSError* error, NSInteger serverStatusCode))failureBlock;
@end
