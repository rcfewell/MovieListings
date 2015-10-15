//
//  theaterTableViewController.h
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "theatersDataSource.h"
#import "theaterDetailedViewController.h"
#import "MoviesTableViewController.h"
//#import "theaters.h"

@interface theaterTableViewController : UITableViewController<DataSourceReadyToUseDelegate, UITableViewDelegate,UITableViewDataSource>

@end
