//
//  DownloadAssistant.h
//  MovieListings
//
//  Created by Riley Fewell on 3/12/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebDataReadyDelegate;

@interface DownloadAssistant : NSObject<NSURLConnectionDelegate>

@property (nonatomic) id<WebDataReadyDelegate> delegate;

- (void) downloadContentsOfURL: (NSURL *)url;
- (NSData *) downloadData;


@end

@protocol WebDataReadyDelegate<NSObject>

- (void) acceptWebData: (NSData *) webData forURL: (NSURL *) url;



@end
