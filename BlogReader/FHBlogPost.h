//
//  FHBlogPost.h
//  BlogReader
//
//  Created by Faris Halteh on 17/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHBlogPost : NSObject

/*
 No need for these since we have properties now!
-(void) setTitle:(NSString*) title;
-(void) setAuthor:(NSString*) author;

-(NSString*) title;
-(NSString*) author;
*/
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;


//This is a designated initializer
-(id) initWithTitle:(NSString*) title andAuthor:(NSString*) author andThumbnail:(NSString*) thumbnail andDate:(NSString*) date;

//Convenience Constructor
+(id) blogPostWithTitle: (NSString*) title andAuthor:(NSString*) author andThumbnail: (NSString*) thumbnail andDate:(NSString*) date;

-(NSURL*) thumbnailURL;

-(NSString*) formattedDate;
@end
