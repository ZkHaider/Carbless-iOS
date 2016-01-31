//
//  MerchantSearch.h
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerchantSearch : NSObject

@property (nonatomic, strong) NSDictionary *searchAddress;
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) NSArray *promotedMerchantIds;
@property (nonatomic, strong) NSArray *merchants;
@property (nonatomic, strong) NSArray *verticals;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSArray *cuisines;
@property (nonatomic, strong) NSArray *popularCuisines;
@property (nonatomic, strong) NSDictionary *priceCompareItems;

@property (nonatomic, strong) NSDictionary *rawDictionary;

/**
 *  Update the model with the JSON response.
 *
 *  @param dictionary JSON
 */
- (void)updateWithDictionary:(NSDictionary *)dictionary;

@end
