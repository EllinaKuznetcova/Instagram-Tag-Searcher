//
//  PostSearchView.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstaPost.h"

@protocol IPostSearchView <NSObject>

-(void) loadingStarted;
-(void) updateViews:(NSArray<InstaPost *> *)posts;
-(void) showError:(NSError*)error;
-(void) showPlaceholder;
-(void) hidePlaceholder;

@end

@interface PostSearchView : UIViewController <IPostSearchView, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *noPostsLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

+(NSString*) identifier;

@end
