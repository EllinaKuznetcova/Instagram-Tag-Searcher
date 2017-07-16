//
//  LoginView.h
//  InstagramTT
//
//  Created by Ellina Kuznecova on 17.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import <UIKit/UIKit.h>
@import WebKit;

@interface LoginView : UIViewController <WKNavigationDelegate>
    @property WKWebView *webView;
@end
