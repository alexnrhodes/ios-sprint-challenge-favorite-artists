//
//  ARArtistDetailViewController.m
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import "ARArtistDetailViewController.h"

@interface ARArtistDetailViewController ()


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *saveArtistButton;

@end

@implementation ARArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.controller searchForPeopleWith:searchBar.text completion:^(ARArtist *srtist, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.nameLabel.text = self.controller.artist.strArtist;
            self.bodyTextView.text = self.controller.artist.strBiographyEN;
            self.nameLabel.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];
            self.bodyTextView.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];
        });
        
    }];
}

- (IBAction)saveArtistButtonTapped:(UIButton *)sender {
    
    [self.controller createArtistWithTitle:self.nameLabel.text body:self.bodyTextView.text];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void) updateViews {
    if (self.isViewLoaded && self.artist != nil) {
        self.searchBar.hidden = YES;
        self.nameLabel.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];
        self.bodyTextView.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];
        self.nameLabel.text = self.artist.strArtist;
        self.bodyTextView.text = self.artist.strBiographyEN;
    } else {
        self.nameLabel.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        self.bodyTextView.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    }
}

@end
