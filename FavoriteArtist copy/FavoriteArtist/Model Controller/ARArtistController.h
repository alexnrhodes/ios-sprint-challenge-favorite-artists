//
//  ARArtistController.h
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARArtist.h"

@interface ARArtistController : NSObject

@property (nonatomic, readonly) NSArray *favoriteArtists;
@property (nonatomic) ARArtist *artist;


- (void)searchForPeopleWith:(NSString *)serchTerm completion:(void (^)(ARArtist *artist, NSError *error))completion;

- (void) createArtistWithTitle:(NSString *)artist body:(NSString *)body;

@end

