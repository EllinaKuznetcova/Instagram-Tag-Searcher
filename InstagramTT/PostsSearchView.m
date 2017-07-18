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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeMVP];
    
    [self.tableView registerNib:[UINib nibWithNibName:[PostCell identifier] bundle:nil]  forCellReuseIdentifier:[PostCell identifier]];
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.presenter searchTappedWithText:@"test"];
}

-(void) initializeMVP {
    self.presenter = [[PostSearchPresenter alloc] initWithView:self];
}

#pragma mark - IPostSearchView Methods

-(void) updateViews:(NSArray<InstaPost *> *)posts {
    [self.tableView reloadData];
}

-(void) showError:(NSError *)error {
    
}

-(void) showPlaceholder {
    
}

-(void) hidePlaceholder {
    
}

#pragma mark - TableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.cachedPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell* cell = [tableView dequeueReusableCellWithIdentifier:[PostCell identifier]];
    InstaPost* post = self.presenter.cachedPosts[indexPath.row];
    [cell prepareCell:post.imageLink
           likesCount:post.likesCount
           comment:post.comment];
    return cell;
}

@end
