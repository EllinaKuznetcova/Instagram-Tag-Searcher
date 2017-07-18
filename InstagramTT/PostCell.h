//
//  PostSearchCell.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 17.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *instaImage;
@property (weak, nonatomic) IBOutlet UILabel *likesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

+(NSString*) identifier;

-(void) prepareCell:(NSURL*)url likesCount:(NSInteger)likesCount comment:(NSString*)comment;

@end
