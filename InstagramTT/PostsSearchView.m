//
//  PostSearchView.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "PostSearchView.h"
#import "PostCell.h"
#import "PostSearchPresenter.h"

@interface PostSearchView ()

@property id<IPostSearchViewPresenter> presenter;

@end

@implementation PostSearchView

+(NSString*) identifier {
    return @"PostSearchView";
}

-(void) initializeMVP {
    self.presenter = [[PostSearchPresenter alloc] initWithView:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeMVP];
    
    [self.tableView registerNib:[UINib nibWithNibName:[PostCell identifier] bundle:nil]  forCellReuseIdentifier:[PostCell identifier]];
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Search Bar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.presenter searchTappedWithText:searchBar.text];
}

#pragma mark - IPostSearchView Methods

-(void) loadingStarted {
    [self.activityIndicator startAnimating];
}

-(void) updateViews:(NSArray<InstaPost *> *)posts {
    [self.activityIndicator stopAnimating];
    [self.tableView reloadData];
}

-(void) showError:(NSError *)error {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Error occured" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:true completion:nil];
}

-(void) showPlaceholder {
    [self.noPostsLabel setHidden:NO];
}

-(void) hidePlaceholder {
    [self.noPostsLabel setHidden:YES];
}

#pragma mark - TableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.cachedPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell* cell = [tableView dequeueReusableCellWithIdentifier:[PostCell identifier]];
    InstaPost* post = self.presenter.cachedPosts[indexPath.row];
    [cell prepareCell:post.imageLink
        withImageSize:post.imageSize
           likesCount:post.likesCount
           comment:post.comment];
    return cell;
}

@end
