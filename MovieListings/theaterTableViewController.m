//
//  theaterTableViewController.m
//  MovieListings
//
//  Created by Riley Fewell on 3/22/15.
//  Copyright (c) 2015 Riley Fewell. All rights reserved.
//

#import "theaterTableViewController.h"

@interface theaterTableViewController ()

@property (nonatomic) theatersDataSource *theaterDataSource;
@property (nonatomic) UIActivityIndicatorView *activityIndicator;
@property (nonatomic) NSString *theater;

@end

static NSString *tableViewCellID = @"Cell";

@implementation theaterTableViewController

-(id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellID];
    
//    NSString *theaterURLString = @"http://www.cs.sonoma.edu/~kooshesh/cs470/movies/dbInterface.py?rType=movieTheaters";
    NSString *theaterURLString = @"http://www.cs.sonoma.edu/~rfewell/movies/dbInterface.py?rType=movieTheaters";
    
    self.theaterDataSource = [[theatersDataSource alloc] initWithTheaterURLString:theaterURLString];
    [self.theaterDataSource setDelegate:self];
    
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(refreshTableView:) forControlEvents:UIControlEventValueChanged];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.activityIndicator setCenter:self.view.center];
    [self.view addSubview:self.activityIndicator];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Theaters";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dataSourceReadyForUse:(theatersDataSource *) dataSource
{
    [self.tableView reloadData];
    [self.activityIndicator stopAnimating];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {    // Return the number of sections.
    if( ! [self.theaterDataSource dataReadyForUse] )
    {
        [self.activityIndicator startAnimating];
        [self.activityIndicator setHidesWhenStopped:YES];
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    NSLog(@"Number of rows in the table: %ld", (long)[self.theaterDataSource numberOfTheaters]);
    
    return [self.theaterDataSource numberOfTheaters];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableViewCellID];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID forIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellStyleSubtitle;
    
    
    
    
    theaters *movieTheater = [self.theaterDataSource theaterAtIndex:[indexPath row]];
    // Configure the cell...
    
    cell.textLabel.text = [movieTheater title];
    NSString *city = @"City: ";
    NSString *cityTitle = [city stringByAppendingString:[movieTheater cityTitle]];
    cell.detailTextLabel.text = cityTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSLog( @"%@", [movieTheater title] );
    
    return cell;
}

-(void) refreshTableView: (UIRefreshControl *) sender
{
    [self.tableView reloadData];
    [sender endRefreshing];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.theaterDataSource deleteTheaterAtIndex:[indexPath row]];
    [self.tableView deleteRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    theaters *movieTheater = [self.theaterDataSource theaterAtIndex:[indexPath row]];
    self.theater = [movieTheater title];
    
    //    MovieTableViewController *mvc = [[MovieTableViewController alloc] init];
    
//    theaterDetailedTableViewController *mvc = [[theaterDetailedTableViewController alloc] initWithTheater:self.theater];
//    theaterDetailedViewController *tvc = [[theaterDetailedViewController alloc] initWithTheater:(theaters *)self.theater];
//    [self.navigationController pushViewController:tvc animated:YES];
    
    MoviesTableViewController *mvc = [[MoviesTableViewController alloc] initWithTheater:(theaters *)self.theater];
    [self.navigationController pushViewController:mvc animated:YES];
    
    
}
@end
