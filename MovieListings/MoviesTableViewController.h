//
//  MoviesTableViewController.h
//  MovieListings
//
//  Created by Riley Fewell on 3/23/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoviesDataSource.h"
#import "MoviesDetailedViewController.h"
#import "theaters.h"


@interface MoviesTableViewController : UITableViewController<DataSourceReadyForUseDelegate, UITableViewDelegate, UITableViewDataSource>

- (instancetype) initWithTheater: (theaters *) theater;

@end
