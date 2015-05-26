//
//  AppResult.m
//  NSURLSessionPlayground
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "AppResult.h"

@implementation AppResult

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        self.appDescription = dictionary[@"description"];
        self.appName = dictionary[@"trackName"];
        self.developer = dictionary[@"artistName"];
        
    }
    return self;
}



@end
