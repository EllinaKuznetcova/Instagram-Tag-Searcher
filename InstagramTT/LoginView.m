//
//  LoginView.m
//  InstagramTT
//
//  Created by Ellina Kuznecova on 17.07.17.
//  Copyright © 2017 Ellina Kuznetcova. All rights reserved.
//

#import "LoginView.h"
#import "InstagramService.h"
#import "Helpers.h"

@interface LoginView ()

@property (weak, nonatomic) IBOutlet UIView *webViewContainer;

@end

@implementation LoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration* configuration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    self.webView.navigationDelegate = self;
    self.webViewContainer = self.webView;
    
    NSURL *authURL = [[[InstagramService alloc] init] authorizationURL];
    [self.webView loadRequest:[NSURLRequest requestWithURL:authURL]];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(nonnull WKNavigationAction *)navigationAction decisionHandler:(nonnull void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSError *error;
    
    if ([[[InstagramService alloc] init] checkTokenAndSaveFromURL:navigationAction.request.URL error:&error]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        [Helpers showPostSearchController];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
