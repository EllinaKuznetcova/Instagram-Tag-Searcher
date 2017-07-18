//
//  InstaPost.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 18.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface InstaPost : NSObject

@property NSURL* imageLink;
@property CGSize imageSize;
@property NSInteger likesCount;
@property NSString* comment;

@end
