//
//  AppResult.h
//  NSURLSessionPlayground
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppResult : NSObject

@property (nonatomic, strong) NSString *developer;
@property (nonatomic, strong) NSString *appDescription;
@property (nonatomic, strong) NSString *appName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
