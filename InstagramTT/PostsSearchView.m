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
}

-(void) initializeMVP {
    self.presenter = [[PostSearchPresenter alloc] initWithView:self];
}

#pragma mark - IPostSearchView Methods

-(void) updateViews:(NSArray *)posts {
    
}

-(void) showError:(NSError *)error {
    
}

-(void) showPlaceholder {
    
}

-(void) hidePlaceholder {
    
}

#pragma mark - TableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //TODO: add methods to presenter interface to retrieve number ob objects
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell* cell = [tableView dequeueReusableCellWithIdentifier:[PostCell identifier]];
    [cell prepareCell:[NSURL URLWithString:@"https://ellinakuznetcova.github.io/images/avatars/avatar.png"]
           likesCount:@"10"
           comment:@"Some cool comment"];
    return cell;
}

@end
