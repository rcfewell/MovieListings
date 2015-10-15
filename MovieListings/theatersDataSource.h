//
//  theatersDataSource.h
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadAssistant.h"
#import "theaters.h"

@protocol DataSourceReadyToUseDelegate;

@interface theatersDataSource : NSObject<WebDataReadyDelegate>

@property (nonatomic) id<DataSourceReadyToUseDelegate> delegate;
@property (nonatomic) BOOL dataReadyForUse;

//function definitions go here
- (NSMutableArray *) theater;
- (instancetype) initWithTheaterURLString: (NSString *) tURL;
- (void) processTheaterJSON;
- (void) print;
- (void) acceptWebData:(NSData *) webData forURL:(NSURL *) url;
- (theaters *) theaterWithName: (NSString *) theaterName;
- (NSArray *) getAllTheaters;
-(BOOL) deleteTheaterAtIndex: (NSInteger) idx;
- (theaters *) theaterAtIndex: (int) idx;
- (NSInteger ) numberOfTheaters;
- (NSString *) theaterTabBarTitle;

@end

@protocol DataSourceReadyToUseDelegate <NSObject>

@optional

- (void) dataSourceReadyForUse: (theatersDataSource *) dataSource;

@end




