//
//  FHMasterViewController.m
//  BlogReader
//
//  Created by Faris Halteh on 16/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import "FHMasterViewController.h"

#import "FHDetailViewController.h"
#import "FHBlogPost.h"

@implementation FHMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //to retrieve the JSON Data
    
    //first create the NSURL
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    //JSON Data
    NSData * JSONData = [NSData dataWithContentsOfURL:blogURL];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&error];
    NSLog(@"%@",dataDictionary);

    //no longer needed: self.blogPosts = [dataDictionary objectForKey:@"posts"];
    self.blogPosts = [NSMutableArray array];
    NSArray *blogPostArray = [dataDictionary objectForKey:@"posts"];
    
    //need to loop through
    for(NSDictionary *bpDictionary in blogPostArray)
    {
        
        FHBlogPost *blogPost = [FHBlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"] andAuthor:[bpDictionary objectForKey:@"author"] andThumbnail:[bpDictionary objectForKey:@"thumbnail"] andDate:[bpDictionary objectForKey:@"date"] ];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//      To open a URL page in Safari
//    FHBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
//    UIApplication *application = [UIApplication sharedApplication];
//    [application openURL:blogPost.url];
//    
//    FHDetailViewController *detailViewController = [[FHDetailViewController alloc]initWithNibName:@"Nib Name" bundle:nil];
    
    //pass the selected object to the new view controller.
 //   [self.navigationController pushViewController:detailViewController animated:YES];
}

//This represents the number of categories!
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.blogPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //dequeue allows the interface to only load the objects that are visible on the screen (to have a better performance)
    //helps manage memory efficiently by reusing table view cells.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    FHBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];

    //Check if the thumbnail is not null so that it won't give us an error
    if([blogPost.thumbnail isKindOfClass:[NSString class]])
    {
        //Downloading the thumbnail from the internet using NSData (NSURL method is used here)
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *imagePost = [UIImage imageWithData:imageData];
        
        
        //we can create the image on its own UIImage *image = [UIImage imageNamed:@"...png"]; (LOCAL IMAGE)
        //set the image programmatically
        //cell.imageView.image = [UIImage imageNamed:@"Screen Shot 2014-07-18 at 10.37.51.png"];
        
        //to add the image from the internet (the one that we downloaded using NSData and stored it in an instance of UIImage
        cell.imageView.image = imagePost;
        
    }
    else{ //just display the local treehouse image in case the post has no image!
        cell.imageView.image = [UIImage imageNamed:@"Screen Shot 2014-07-18 at 10.37.51.png"];
    }
    
    //changed the object here, now it's NSString (no longer used as it's a dictionary now and not an array)
    //NSString *object = self.blogPosts[indexPath.row];
    
    
        
    //For the title:
    cell.textLabel.text = blogPost.title; //or [blogPost title];
    //For the Subtitle:
    //NSString *author =[blogPost valueForKey:@"author"];
    cell.detailTextLabel.text = blogPost.author;
    
    //going to concatenate the Strings:
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",blogPost.author, blogPost.formattedDate]; //we can also use [blogpost formattedDate] as well!

    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Preparing for Segue %@", segue.identifier);
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSString *title = [self.blogPosts[indexPath.row] title];
        //NSURL *urlOfBP = [self.blogPosts[indexPath.row] url];
        //[[segue destinationViewController] setBlogPostURL:urlOfBP];
        
        //the other way of doing it:
        FHDetailViewController *dvc = (FHDetailViewController*) segue.destinationViewController;
        FHBlogPost *blogPost = self.blogPosts[indexPath.row] ;
        dvc.blogPostURL = blogPost.url;
        
        
    }
}

@end
