//
//  ARArtistTableViewController.m
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import "ARArtistTableViewController.h"

@interface ARArtistTableViewController ()

@property ARArtistController *controller;

@end

@implementation ARArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[ARArtistController alloc]init];
    }
    return self;
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.favoriteArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    ARArtist *artist = self.controller.favoriteArtists[indexPath.row];
    
    cell.textLabel.text = artist.strArtist;
    cell.detailTextLabel.text = artist.strBiographyEN;
   
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddArtistSegue"]) {
        ARArtistDetailViewController *vc = [segue destinationViewController];
        vc.controller = self.controller;
    } else if ([[segue identifier] isEqualToString:@"ArtistDetailSegue"]) {
        ARArtistDetailViewController *vc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        vc.controller = self.controller;
        vc.artist = self.controller.favoriteArtists[indexPath.row];
    }
}

@end
