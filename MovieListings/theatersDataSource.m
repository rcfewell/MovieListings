//
//  theatersDataSource.m
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import "theatersDataSource.h"

@interface theatersDataSource()
{
    BOOL _debug;
}

@property (nonatomic) NSString *theaterURLString;
@property (nonatomic) NSData *theaterNSData;
@property (nonatomic) NSMutableArray *theater;
@property (nonatomic) DownloadAssistant *downloadAssistant;

@end

@implementation theatersDataSource

- (NSMutableArray *) theater
{
    if( _theater == nil )
        _theater = [[NSMutableArray alloc] init];
    return _theater;
}

- (instancetype) initWithTheaterURLString: (NSString *) tURL
{
    if( (self = [super init]) == nil )
        return nil;
    
    self.theaterURLString = tURL;
    _debug = YES;
    
    _downloadAssistant = [[DownloadAssistant alloc]init];
    [self.downloadAssistant setDelegate:self];
    
    self.dataReadyForUse = NO;
    
    NSURL *url = [NSURL URLWithString:self.theaterURLString];
    [self.downloadAssistant downloadContentsOfURL:url];
    
    return self;
}

- (void) processTheaterJSON
{
    NSError *parseError = nil;
    NSArray *jsonString = [NSJSONSerialization JSONObjectWithData:self.theaterNSData options:0 error:&parseError];
    
    if( _debug )
        NSLog( @"%@", jsonString );
    
    if( parseError )
    {
        NSLog( @"In theater Badly formed JSON string: %@", [parseError localizedDescription] );
        return;
    }
    
    for( NSMutableDictionary *theaterTuple in jsonString )
    {
        theaters *theater = [[theaters alloc] initWithDictionary:theaterTuple];
        if( _debug )
            [theater print];
        [self.theater addObject:theater];
        NSLog( @"num movie theaters %lu", (unsigned long)[self.theater count] );
    }
    
    self.theaterNSData = nil;
    if( [self.delegate respondsToSelector:@selector(dataSourceReadyForUse:)] )
        [self.delegate performSelector:@selector(dataSourceReadyForUse:) withObject:self];
    
    
}

- (void) print
{
    NSLog( @"number of movie theaters %lu", (unsigned long)[self.theater count] );
    for( theaters *t in self.theater )
        [t print];
}

- (void) acceptWebData:(NSData *) webData forURL:(NSURL *) url
{
    self.theaterNSData = webData;
    [self processTheaterJSON];
    [self print];
    NSLog( @"completing printing movie theaters" );
    self.dataReadyForUse = YES;
    
}

- (theaters *) theaterWithName: (NSString *) theaterName
{
    if( [self.theater count] == 0 )
        return nil;
    
    for( theaters *theater in self.theater )
        if( [theater.title isEqualToString:theaterName] )
            return theater;
    return nil;
}

- (NSArray *) getAllTheaters
{
    return  self.theater;
}

-(BOOL) deleteTheaterAtIndex: (NSInteger) idx
{
    [self.theater removeObjectAtIndex:idx];
    return YES;
}

- (theaters *) theaterAtIndex: (int) idx
{
    if( idx >= [self.theater count] )
        return nil;
    return [self.theater objectAtIndex:idx];
}

- (NSInteger ) numberOfTheaters
{
    return [self.theater count];
}

- (NSString *) theaterTabBarTitle
{
    return @"Movie Theater";
}

@end
