//
//  MoviesDataSource.h
//  MovieListings
//
//  Created by Riley Fewell on 3/23/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
#import "DownloadAssistant.h"

@protocol DataSourceReadyForUseDelegate;


@interface MoviesDataSource : NSObject<WebDataReadyDelegate>

@property (nonatomic) id<DataSourceReadyForUseDelegate> delegate;
@property (nonatomic) BOOL dataReadyForUse;

// function definitions go here
-(NSMutableArray *) allMovies;
-(instancetype) initWithMoviesAtURLString: (NSString *) mURL;
-(void) processMoviesJSON;
-(void) print;
-(void) acceptWebData:(NSData *)webData forURL:(NSURL *)url;
-(Movie *) movieWithTitle: (NSString *) movieTitle;
-(NSArray *) getAllMovies;
-(void) limitToTheater: (NSString *) theater;
-(BOOL) deleteMovieAtIndex: (NSInteger) idx;
-(Movie *) movieAtIndex: (NSInteger) idx;
-(NSInteger) numberOfMovies;
-(NSString *) moviesTabBarTitle;
-(NSString *) moviesBarButtonItemBackButtonTitle;
-(NSString *) moviesTabBarImage;



@end

@protocol DataSourceReadyForUseDelegate <NSObject>

@optional

-(void) dataSourceReadyForUse: (MoviesDataSource *) dataSource;

@end
