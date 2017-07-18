//
//  PostSearchView.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "PostSearchView.h"
#import "PostCell.h"

@interface PostSearchView ()

@end

@implementation PostSearchView

+(NSString*) identifier {
    return @"PostSearchView";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:[PostCell identifier] bundle:nil]  forCellReuseIdentifier:[PostCell identifier]];
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
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
