//
//  SearchAddress.h
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchAddress : NSObject

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *neighborhood;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *subLocality;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *unit;

- (void)updateWithDictionary:(NSDictionary *)dictionary;

@end
