//
//  ARArtist.h
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ARArtist : NSObject

@property NSString *strArtist; 
@property NSString *strBiographyEN;

- (instancetype) initWithArtistName:(NSString *)artist biography:(NSString *)biography;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

