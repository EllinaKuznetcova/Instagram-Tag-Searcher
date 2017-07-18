//
//  PostSearchModel.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostSearchPresenter.h"

@protocol IPostSearchModel <NSObject>

-(void) searchPostsByTag:(NSString*)tag;

@end

@interface PostSearchModel : NSObject <IPostSearchModel>

- (instancetype)initWithPresenter:(id<IPostSearchModelPresenter>)presenter;

@end
