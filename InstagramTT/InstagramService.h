//
//  InstagramService.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IInstagramService <NSObject>

@end

@interface InstagramService : NSObject<IInstagramService>

-(BOOL) checkTokenAndSaveFromURL:(NSURL *)url
                           error:(NSError *__autoreleasing *)error;

-(NSURL*)authorizationURL;

@end
