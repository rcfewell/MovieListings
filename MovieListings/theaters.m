//
//  theaters.m
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import "theaters.h"

@interface theaters()

@property (nonatomic) NSDictionary *theatersAttrs;

@end

enum {VIEW_HEIGHT = 90};


@implementation theaters

- (id) initWithDictionary: (NSMutableDictionary *) dictionary
{
    if( (self = [super init]) == nil )
        return  nil;
    self.theatersAttrs = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    return self;
}

- (void) addValue: (NSString *) attrVal forAttribute: (NSString *) attrName
{
    [self.theatersAttrs setValue:attrVal forKey:attrName];
}

- (NSString *) getValueForAttribute: (NSString *) attr
{
    return [self.theatersAttrs valueForKey:attr];
}

- (NSString *) title
{
    return [self.theatersAttrs valueForKey:@"theaterName"];
//    return [self.theatersAttrs valueForKey:@"movieTitle"];
}

- (NSString *) cityTitle
{
    return [self.theatersAttrs valueForKey:@"cityName"];
}

- (CGSize) sizeOfListEntryView
{
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    return CGSizeMake(bounds.size.height, VIEW_HEIGHT);
}

- (NSAttributedString *) compose: str withBoldPrefix: (NSString *) prefix
{
    const CGFloat fontSize = 13;
    
    UIFont *boldFont = [UIFont boldSystemFontOfSize:fontSize];
    UIFont *regularFont = [UIFont systemFontOfSize:fontSize];
    UIFont *italicFont = [UIFont italicSystemFontOfSize:fontSize];
    UIColor *foregroundColor = [UIColor blackColor];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:regularFont, NSFontAttributeName, foregroundColor, NSForegroundColorAttributeName, nil];
    
    NSDictionary *boldAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:boldFont, NSFontAttributeName, nil];
    
    NSMutableAttributedString * attrString = nil;
    
    if( [prefix isEqualToString:@""] )
    {
        [attrs setObject:italicFont forKey: NSFontAttributeName];
        attrString = [[NSMutableAttributedString alloc] initWithString:str attributes:attrs];
    }
    else
    {
        NSString *text = [NSString stringWithFormat:@"%@: %@", prefix, str];
        attrString = [[NSMutableAttributedString alloc] initWithString:text attributes:attrs];
        NSRange range = NSMakeRange(0, prefix.length);
        [attrString setAttributes:boldAttrs range:range];
    }
    
    
    return attrString;
}

- (void) print
{
    NSEnumerator *tEnum = [self.theatersAttrs keyEnumerator];
    NSString *attrName;
    while( attrName == (NSString *) [tEnum nextObject] )
    {
        NSLog( @"Attribute Name: %@", attrName );
        NSLog( @"Attribute Value: %@", [self.theatersAttrs valueForKey:attrName]);
    }
}

@end
