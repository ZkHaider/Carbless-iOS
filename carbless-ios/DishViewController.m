//
//  DishViewController.m
//  carbless-ios
//
//  Created by Haider Khan on 1/19/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DishViewController.h"
#import "DishCollectionViewCell.h"
#import "CuisineViewCell.h"

@interface DishViewController ()

@end

@implementation DishViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set delegates to the collectionview
    self.dishCollectionView.delegate = self;
    self.dishCollectionView.dataSource = self;
    
    // Hide the nav bar
    [[self navigationController] setNavigationBarHidden:YES];
    
    // Get the height of the header view and the height of the navigation bar
    CGFloat headerViewHeight = self.headerView.bounds.size.height;
    
    // Make a UIEdgeInset with that height and set it to the UICollectionView
    UIEdgeInsets topDishCollectionViewInset = UIEdgeInsetsMake(headerViewHeight + 4, 4, 4, 4);
    self.dishCollectionView.contentInset = topDishCollectionViewInset;
    
    // Add a shadow to the headerview
    self.headerView.layer.masksToBounds = NO;
    self.headerView.layer.shadowOffset = CGSizeMake(0, 4);
    self.headerView.layer.shadowRadius = 5;
    self.headerView.layer.shadowOpacity = 0.5;
    
    // Brings the header view to the front
    [self.headerView.superview bringSubviewToFront:self.headerView];
    
    // Change textfield border color
    self.searchCuisineTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.searchCuisineTextField.layer.borderWidth = 1.5;
    self.searchCuisineTextField.layer.cornerRadius = 15.0;
    
    // Set done to textfield
    [self.searchCuisineTextField setReturnKeyType:UIReturnKeySearch];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - CollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Make it dynamic...
    CGFloat cellWidth = collectionView.bounds.size.width;
    
    // Substract the layout margins...
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) collectionViewLayout;
    
    CGFloat sectionInsetLeft    = flowLayout.sectionInset.left;
    CGFloat sectionInsetRight   = flowLayout.sectionInset.right;
    CGFloat contentInsetLeft    = collectionView.contentInset.left;
    CGFloat contentInsetRight   = collectionView.contentInset.right;
    
    CGFloat totalSectionInset = sectionInsetLeft + sectionInsetRight;
    CGFloat totalContentInset = contentInsetLeft + contentInsetRight;
    
    cellWidth -= totalSectionInset + totalContentInset + flowLayout.minimumInteritemSpacing;
    
    // Half of it because 1 cell
    cellWidth /= 2.0;
    
    return CGSizeMake(cellWidth, cellWidth);
}

# pragma mark - CollectionView Datasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CuisineViewCell *cuisineViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cuisineViewCell" forIndexPath:indexPath];
    
    // Setup cell here...
    
    return cuisineViewCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
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
