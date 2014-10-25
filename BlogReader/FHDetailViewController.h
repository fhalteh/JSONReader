//
//  FHDetailViewController.h
//  BlogReader
//
//  Created by Faris Halteh on 16/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *blogPostURL;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
