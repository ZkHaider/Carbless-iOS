//
//  CuisineViewCell.h
//  carbless-ios
//
//  Created by Haider Khan on 1/31/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CuisineViewCell : UICollectionViewCell

/**
 * Views
 */
@property (weak, nonatomic) IBOutlet UIImageView *cuisineImage;
@property (weak, nonatomic) IBOutlet UIView *cuisineNestedView;
@property (weak, nonatomic) IBOutlet UILabel *cuisineLabel;

@end
