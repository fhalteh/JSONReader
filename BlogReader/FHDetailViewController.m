//
//  FHDetailViewController.m
//  BlogReader
//
//  Created by Faris Halteh on 16/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import "FHDetailViewController.h"

@interface FHDetailViewController ()
- (void)configureView;
@end

@implementation FHDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSURL *url = [NSURL URLWithString:@"http://blog.teamtreehouse.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL];
    [self.webView loadRequest:urlRequest];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
