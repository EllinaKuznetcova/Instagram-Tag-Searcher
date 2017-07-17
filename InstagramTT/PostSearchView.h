//
//  PostSearchView.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 15.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IPostSearchView <NSObject>


@end

@interface PostSearchView : UIViewController <IPostSearchView, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

+(NSString*) identifier;

@end
