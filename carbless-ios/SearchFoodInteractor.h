//
//  SearchFoodInteractor.h
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MerchantSearch.h"

@interface SearchFoodInteractor : NSObject

/**
 *  Get local restaraunts based on the user's longitude and latitude, and specify whether it is pickup or delivery.
 *
 *  @param method    pickup | delivery
 *  @param latitude  latitude
 *  @param longitude longitude
 *  @param success   json response
 *  @param failure   error
 */
- (void)getLocalRestarauntsWithMethod:(NSString *)method latitude:(NSString *)latitude longitude:(NSString *)longitude success:(void (^)(MerchantSearch *merchantSearch))success failure:(void (^)(NSError *error))failure;



@end
