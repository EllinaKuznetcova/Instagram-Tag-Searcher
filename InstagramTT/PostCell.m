//
//  PostSearchCell.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 17.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "PostCell.h"
@import SDWebImage;

@implementation PostCell

+(NSString*) identifier {
    return NSStringFromClass([self class]);
}

-(void) prepareCell:(NSURL *)url likesCount:(NSString *)likesCount comment:(NSString *)comment {
    [self.instaImage sd_setImageWithURL:url];
    self.likesCountLabel.text = [NSString stringWithFormat:@"%@ likes", likesCount];
    self.commentLabel.text = comment;
}

@end
