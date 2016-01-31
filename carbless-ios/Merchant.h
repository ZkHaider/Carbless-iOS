//
//  Merchant.h
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Merchant : NSObject

@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, assign) BOOL isMatchingCuisine;
@property (nonatomic, assign) BOOL isSimilarCuisine;
@property (nonatomic, assign) BOOL isMatchingItems;
@property (nonatomic, assign) BOOL isMatchingName;
@property (nonatomic, strong) NSArray *cuisineScores;
@property (nonatomic, strong) NSDictionary *summary;

- (void)updateWithDictionary:(NSDictionary *)dictionary;

@end
