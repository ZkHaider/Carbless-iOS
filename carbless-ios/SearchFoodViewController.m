//
//  ViewController.m
//  carbless-ios
//
//  Created by Haider Khan on 1/16/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import "SearchFoodViewController.h"
#import "SearchFoodInteractor.h"

@interface SearchFoodViewController () {
    @private
    SearchFoodInteractor *_searchFoodInteractor;
    MerchantSearch *_merchantSearch;
}

@end

@implementation SearchFoodViewController

# pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)loadView {
    [super loadView];
}

# pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create our interactor
    [self createInteractor];
    
    // Load restaurants
    [self loadDeliveryRestaurants];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Private Inline

- (void)createInteractor {
    _searchFoodInteractor = [[SearchFoodInteractor alloc] init];
}

- (void)loadDeliveryRestaurants {
    // Load restaraunts
    NSString *latitude = @"37.7809462";
    NSString *longitude = @"-122.406917";
    [_searchFoodInteractor getLocalRestarauntsWithMethod:@"delivery" latitude:latitude longitude:longitude success:^(MerchantSearch *merchantSearch) {
        _merchantSearch = merchantSearch;
    } failure:^(NSError *error) {
        
    }];
}

@end
