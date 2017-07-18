//
//  PostSearchModel.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "PostSearchModel.h"
#import "InstagramService.h"

@interface PostSearchModel()

@property (weak) id<IPostSearchModelPresenter> presenter;

@end

@implementation PostSearchModel

- (instancetype)initWithPresenter:(id<IPostSearchModelPresenter>)presenter {
    self = [super init];
    if (self) {
        self.presenter = presenter;
    }
    return self;
}

#pragma mark - IPostSearchModel methods
-(void) searchPostsByTag:(NSString*)tag {
    __weak typeof(self)wself = self;
    [[[InstagramService alloc] init] searchPostsByTag:tag withSuccess:^(NSArray<InstaPost *> *posts) {
        [wself.presenter loadingSucceded:posts];
    } failure:^(NSError *error, NSInteger serverStatusCode) {
        [wself.presenter loadingFailed:error];
    }];
}

@end
