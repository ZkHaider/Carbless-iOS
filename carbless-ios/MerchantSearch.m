//
//  MerchantSearch.m
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import "MerchantSearch.h"

@implementation MerchantSearch

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    self.searchAddress = (NSDictionary *) dictionary[@"search_address"];
    self.messages = (NSArray *) dictionary[@"message"];
    self.promotedMerchantIds = (NSArray *) dictionary[@"promoted_merchants_id"];
    self.merchants = (NSArray *) dictionary[@"merchants"];
    self.verticals = (NSArray *) dictionary[@"verticals"];
    self.categories = (NSArray *) dictionary[@"categories"];
    self.cuisines = (NSArray *) dictionary[@"cuisines"];
    self.popularCuisines = (NSArray *) dictionary[@"popular_cuisines"];
    self.priceCompareItems = (NSDictionary *) dictionary[@"price_compare_items"];
    
    self.rawDictionary = [[NSDictionary alloc] initWithDictionary:dictionary];
}

@end
