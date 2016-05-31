//
//  WebViewController.m
//  WebViewTest
//
//  Created by David June Kang on 2016. 5. 27..
//  Copyright © 2016년 ven2s. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate, UITextFieldDelegate>

- (IBAction)onTouchUpInsideBtn:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *backwardButton;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    UITextField *urlTextField = self.urlTextField;
    urlTextField.placeholder = @"주소입력창";
    urlTextField.borderStyle = UITextBorderStyleLine;
    urlTextField.backgroundColor = [UIColor whiteColor];
    urlTextField.delegate = self;
    
    self.urlTextField = urlTextField;
    
    
    UIButton *goButton = self.goButton;
    [goButton setTitle:@"GO" forState:UIControlStateNormal];
    [goButton addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    goButton.tag = 1;
    self.goButton = goButton;
    
    
    UIWebView *webView = self.webView;
    webView.delegate = self;
    webView.backgroundColor = [UIColor clearColor];
    self.webView = webView;
    
    UIButton *backWardButton = self.backwardButton;
    [backWardButton setTitle:@"<" forState:UIControlStateNormal];
    [backWardButton addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    backWardButton.tag = 2;
    self.backwardButton = backWardButton;
    
    UIButton *forWardButton = self.forwardButton;
    [forWardButton setTitle:@">" forState:UIControlStateNormal];
    [forWardButton addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    forWardButton.tag = 3;
    self.forwardButton = forWardButton;
    
    UIButton *refreshButton = self.refreshButton;
    [refreshButton setTitle:@"🔃" forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    refreshButton.tag = 4;
    self.refreshButton = refreshButton;
    
    
}
     
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"call textFieldShouldReturn");
   
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTouchUpInsideBtn:(UIButton *)sender {
    NSLog(@"onTouchUpInsideBtn : %ld",sender.tag);
    switch (sender.tag) {
        case 1:
            if(![self.urlTextField.text isEqualToString:@""]){
                NSRange compareString = [self.urlTextField.text rangeOfString:@"http://"];
                
                if(compareString.location == NSNotFound){
                    [self.urlTextField setText:[NSString stringWithFormat:@"%@%@",@"http://",self.urlTextField.text]];
                }
                

                NSString *urlString = self.urlTextField.text;
                
                if([urlString rangeOfString:@"fastcampus.co.kr"].location != NSNotFound){
                    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                            timeoutInterval:30];
                    [self.webView loadRequest:urlRequest];

                }else{
                    NSLog(@"Can not access this site : %@",self.urlTextField.text);
                }
                
                           }
            NSLog(@"%@", self.urlTextField.text);
            break;
        case 2:
            NSLog(@"%@",self.webView.canGoBack ? @"true": @"false");
            if(self.webView.canGoBack){
                sender.enabled = YES;
                [self.webView goBack];
            }
            break;
        case 3:
            NSLog(@"%@",self.webView.canGoForward ? @"true": @"false");
            if(self.webView.canGoForward){
                sender.enabled = YES;
                [self.webView goForward];
            }
            break;
        case 4:
            [self.webView reload];
            break;
            
        default:
            break;
    }
}
@end
