//
//  MainViewController.m
//  carbless-ios
//
//  Created by Haider Khan on 1/17/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "MainViewController.h"
#import "MainCollectionViewCell.h"
#import "SearchFoodInteractor.h"
#import "MerchantSearch.h"

@interface MainViewController () {
    @private
    SearchFoodInteractor *searchFoodInteractor;
    MerchantSearch *merchantSearch;
    NSArray *merchants;
}

@end

@implementation MainViewController

# pragma mark - LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    // Create our interactor
    [self createInteractor];
    
    // Load restaurants
    [self loadDeliveryRestaurants];
    
    // Set datasource and delegate
    _menuCollectionView.delegate = self;
    _menuCollectionView.dataSource = self;
    
    self.navigationController.hidesBarsOnSwipe = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Local Restaraunts";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - CollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

# pragma mark - CollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // 1 Section only
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (merchantSearch) ? [[merchantSearch merchants] count] : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MainCollectionViewCell *mainCell = (MainCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"restarauntCell" forIndexPath:indexPath];
    
    // Add a shadow
    mainCell.layer.masksToBounds = false;
    mainCell.layer.shadowOpacity = 0.5;
    mainCell.layer.shadowRadius = 5.0;
    mainCell.layer.shadowOffset = CGSizeZero;
    mainCell.layer.shadowColor = [[UIColor grayColor] CGColor];
    mainCell.layer.shouldRasterize = YES;
    
    // Get the name of the restaraunt
    NSDictionary *merchant = (NSDictionary *) [merchants objectAtIndex:[indexPath row]];
    NSDictionary *summary = nil;
    if (merchant[@"summary"])
        summary = merchant[@"summary"];
    
    NSString *name = nil;
    if (summary && summary[@"name"])
        name = summary[@"name"];
    
    // Set the name
    mainCell.restarauntName.text = name;
    mainCell.restarauntName.numberOfLines = 1;
    mainCell.restarauntName.minimumFontSize = 8;
    mainCell.restarauntName.adjustsFontSizeToFitWidth = YES;
    
    // Get the merchant logo
    NSString *logo = nil;
    if (summary && summary[@"merchant_logo"]) {
        logo = summary[@"merchant_logo"];
    
        // Load image with SDWebImage
        [mainCell.restarauntImage sd_setImageWithURL:[NSURL URLWithString:logo]];
    }
    
    return mainCell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 4, 0, 4);
}

# pragma mark - Private Inline

- (void)createInteractor {
    searchFoodInteractor = [[SearchFoodInteractor alloc] init];
}

- (void)loadDeliveryRestaurants {
    // Load restaraunts
    NSString *latitude = @"37.7809462";
    NSString *longitude = @"-122.406917";
    [searchFoodInteractor getLocalRestarauntsWithMethod:@"delivery" latitude:latitude longitude:longitude success:^(MerchantSearch *search) {
        
        // Get merchant search object and set merchants
        merchantSearch = search;
        merchants = (NSArray *) [merchantSearch merchants];
        
        NSLog(@"%@", merchants);
        
        // Reload menu collectionview
        [_menuCollectionView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
