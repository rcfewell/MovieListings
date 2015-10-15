//
//  theaterDetailedViewController.m
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import "theaterDetailedViewController.h"

@interface theaterDetailedViewController ()

@property (nonatomic) theaters *theater;

@end

@implementation theaterDetailedViewController

- (instancetype) initWithTheater:(theaters *)theater
{
    if( (self = [super init]) == nil )
        return nil;
    
    self.theater = theater;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
}

@end
