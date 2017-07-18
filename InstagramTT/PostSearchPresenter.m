//
//  PostSearchPresenter.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "PostSearchPresenter.h"
#import "PostSearchModel.h"

@interface PostSearchPresenter()

@property (weak) id<IPostSearchView> view;
@property id<IPostSearchModel> model;

@end

@implementation PostSearchPresenter

- (instancetype)initWithView:(id<IPostSearchView>)view {
    self = [super init];
    if (self) {
        self.view = view;
        self.model = [[PostSearchModel alloc] initWithPresenter:self];
    }
    return self;
}

#pragma mark - Model's presenter methods
-(void) loadingStarted {
    [self.view loadingStarted];
    [self.view hidePlaceholder];
}

-(void) loadingSucceded:(NSArray<InstaPost*> *)posts {
    [self.view updateViews:posts];
    if (posts.count > 0) {
        [self.view hidePlaceholder];
    } else {
        [self.view showPlaceholder];
    }
}

-(void) loadingFailed:(NSError*)error {
    [self.view showError:error];
}

#pragma mark - View's presenter methods
-(void) searchTappedWithText:(NSString*)text {
    [self.model searchPostsByTag:text];
}

-(NSArray<InstaPost*> *) cachedPosts {
    return [self.model cachedPosts];
}

@end
