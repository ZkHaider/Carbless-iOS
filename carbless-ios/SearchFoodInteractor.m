//
//  SearchFoodInteractor.m
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import "SearchFoodInteractor.h"
#import "APIConstants.h"
#import "API.h"
#import "MerchantSearch.h"

static NSString *const kDelivery = @"delivery";
static NSString *const kPickup = @"pickup";

@implementation SearchFoodInteractor

- (void)getLocalRestarauntsWithMethod:(NSString *)method latitude:(NSString *)latitude longitude:(NSString *)longitude success:(void (^)(MerchantSearch *merchantSearch))success failure:(void (^)(NSError *))failure {
    // Create path
    NSString *path = nil;
    if ([method isEqualToString:kDelivery])
        path = [NSString stringWithFormat:@"%@%@", @"/merchant/search/", kDelivery];
    else
        path = [NSString stringWithFormat:@"%@%@", @"/merchant/search/", kPickup];
    
    NSDictionary *params = @{
                             @"client_id": CLIENT_ID,
                             @"latitude": latitude,
                             @"longitude": longitude
                             };
    
    // Call client to get response
    [[API getInstance] GET:path parameters:params completion:^(id JSON, NSError *error) {
        // If there is no error pass the result back to the success block
        if (!error) {
            
            // Cast response to dictionary
            NSDictionary *response = (NSDictionary *) [JSON result];
            
            if (response) {
                // Convert to model
                MerchantSearch *merchantSearch = [[MerchantSearch alloc] init];
                [merchantSearch updateWithDictionary:response];
                
                // Pass back to view
                success(merchantSearch);
                
            } else {
                failure(error);
            }
        } else {
            failure(error);
        }
    }];
}

@end
