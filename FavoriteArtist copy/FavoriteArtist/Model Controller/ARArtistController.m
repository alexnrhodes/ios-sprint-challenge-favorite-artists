//
//  ARArtistController.m
//  FavoriteArtist
//
//  Created by Alex Rhodes on 11/8/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

#import "ARArtistController.h"
#import "ARArtist.h"

@interface ARArtistController ()

@property (nonatomic, copy) NSMutableArray *internalFavoriteArtists;

@end

@implementation ARArtistController

- (NSArray *)favoriteArtists {
    return [self.internalFavoriteArtists copy];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalFavoriteArtists = [[NSMutableArray alloc]init];
    }
    return self;
}

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (void) createArtistWithTitle:(NSString *)artist body:(NSString *)body {
    ARArtist *newArtist = [[ARArtist alloc]initWithArtistName:artist biography:body];
    [self.internalFavoriteArtists addObject:newArtist];
}


- (void)searchForPeopleWith:(NSString *)serchTerm completion:(void (^)(ARArtist *artist, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components =  [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:serchTerm];
    [components setQueryItems:@[searchItem]];
    
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Search results");
        
        // check for error, call completion
        if (error) {
            completion(nil,error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion(nil,error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError) {
            completion(nil,error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) { // [NSArray class] [NSNull class]
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil,error); // TODO: Create a meaningful error type
            return;
        }
        
        NSArray *artists = json[@"artists"];
                
        for (NSDictionary *dictionary in artists) {
            ARArtist *artist = [[ARArtist alloc] initWithDictionary:dictionary];
            self.artist = artist;
        }
        completion(self.artist,nil);
        
    }];
    [task resume];
}


@end
