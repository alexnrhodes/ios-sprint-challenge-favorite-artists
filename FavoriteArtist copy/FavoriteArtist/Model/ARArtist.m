//
//  ARArtist.m
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import "ARArtist.h"

@implementation ARArtist

- (instancetype) initWithArtistName:(NSString *)artist biography:(NSString *)biography; {
    if (self = [super init]) {
        _strArtist = artist;
        _strBiographyEN = biography;
    }; return self;
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary; {
    
    NSString *artist = dictionary[@"strArtist"];
    NSString *biography = dictionary[@"strBiographyEN"];

    return [self initWithArtistName:artist biography:biography];
}

@end
