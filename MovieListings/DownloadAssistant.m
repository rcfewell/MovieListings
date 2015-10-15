//
//  DownloadAssistant.m
//  MovieListings
//
//  Created by Riley Fewell on 3/12/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import "DownloadAssistant.h"

@interface DownloadAssistant ()
    
@property (nonatomic) NSMutableData *inData;
@property (nonatomic) NSURLConnection *conn;
@property (nonatomic, strong) NSURL *url;

@end

@implementation DownloadAssistant

- (NSData *) downloadData
{
    return self.inData;
}

- (void) downloadContentsOfURL:(NSURL *) url
{
    self.url = url;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    if( _conn )
        [_conn cancel];
    
    _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (NSMutableData *) inData
{
    if( ! _inData )
        _inData = [[NSMutableData alloc] init];
    return _inData;
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *) response {
    
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.inData appendData:data];
}

- (void) connectionDidFinishLoading: (NSURLConnection *) connection
{
    if( [self.delegate respondsToSelector:@selector(acceptWebData:forURL:)] )
        [self.delegate acceptWebData:self.inData forURL:self.url];
    self.inData = nil;
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.inData = nil;
}


@end















