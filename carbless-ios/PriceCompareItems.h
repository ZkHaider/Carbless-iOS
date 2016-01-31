//
//  PriceCompareItems.h
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriceCompareItems : NSObject

@property (nonatomic, strong) NSArray *laundry;
@property (nonatomic, strong) NSArray *tailoring;
@property (nonatomic, strong) NSArray *custom;
@property (nonatomic, strong) NSArray *home;
@property (nonatomic, strong) NSArray *otherItems;
@property (nonatomic, strong) NSArray *popularItems;

- (void)updateWithDictionary:(NSDictionary *)dictionary;

@end
