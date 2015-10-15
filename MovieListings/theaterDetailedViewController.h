//
//  theaterDetailedViewController.h
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "theaters.h"
//#import "DownloadAssistant.h"
//#import "theatersDataSource.h"

@interface theaterDetailedViewController : UIViewController

- (instancetype) initWithTheater: (theaters *) theater;

@end
