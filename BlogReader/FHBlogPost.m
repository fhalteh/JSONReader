//
//  FHBlogPost.m
//  BlogReader
//
//  Created by Faris Halteh on 17/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import "FHBlogPost.h"

@implementation FHBlogPost

-(id) initWithTitle:(NSString*) title andAuthor: (NSString*) author andThumbnail:(NSString *)thumbnail andDate:(NSString*) date{
    self = [super init];
    if(self){
        self.title = title;
        self.author = author;
        self.thumbnail = thumbnail;
        self.date = date;
        //or this: [self setTitle:title];
    }
    return self;
}

+(id) blogPostWithTitle: (NSString*) title andAuthor:(NSString*) author andThumbnail: (NSString*) thumbnail andDate:(NSString*) date{
    
    return [[self alloc] initWithTitle:title andAuthor:author andThumbnail:thumbnail andDate:date];
}

-(NSURL*) thumbnailURL{
    
    NSLog(@"Class Type: %@", [self.thumbnail class]);
    
    NSURL *URL_thumb = [NSURL URLWithString:self.thumbnail];
    return URL_thumb;
}

-(NSString*) formattedDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    
    [dateFormatter setDateFormat:@"EE MMM, dd"];
    return [dateFormatter stringFromDate:tempDate];
}


/*
 no longer needed after implementing the property !
-(void) setTitle:(NSString*) _title{
    title = _title;
}
-(void) setAuthor:(NSString*) _author{
    author = _author;
}

-(NSString*) title{
    return title;
}

-(NSString*) author{
    return author;
}

*/

@end
