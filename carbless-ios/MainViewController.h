//
//  MainViewController.h
//  carbless-ios
//
//  Created by Haider Khan on 1/17/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionView;

@end
