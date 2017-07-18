//
//  PostSearch.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostSearchView.h"

@protocol IPostSearchModelPresenter <NSObject>

-(void) loadingStarted;
-(void) loadingSucceded:(NSArray*)posts;
-(void) loadingFailed:(NSError*)error;

@end

@protocol IPostSearchViewPresenter <NSObject>

-(void) searchTappedWithText:(NSString*)text;

@end

@interface PostSearchPresenter : NSObject <IPostSearchModelPresenter, IPostSearchViewPresenter>

- (instancetype)initWithView:(id<IPostSearchView>)view;

@end

