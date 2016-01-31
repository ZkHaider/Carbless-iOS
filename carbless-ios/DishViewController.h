//
//  DishViewController.h
//  carbless-ios
//
//  Created by Haider Khan on 1/19/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UINavigationItem *dishNavBar;
@property (weak, nonatomic) IBOutlet UICollectionView *dishCollectionView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITextField *searchCuisineTextField;

@end
