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

-(void) updateViews:(NSArray<InstaPost *> *)posts;
-(void) showError:(NSError*)error;
-(void) showPlaceholder;
-(void) hidePlaceholder;

@end

@interface PostSearchView : UIViewController <IPostSearchView, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

+(NSString*) identifier;

@end
