//
//  ARArtistDetailViewController.h
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARArtistController.h"
#import "ARArtist.h"

@interface ARArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property ARArtistController *controller;
@property ARArtist *artist;

@end

