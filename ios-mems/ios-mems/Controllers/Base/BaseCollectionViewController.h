//
//  BaseCollectionViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewController : UICollectionViewController

-(void)initInfoItemWithTarget:(BaseCollectionViewController *)target;
-(void)initPhotoItemWithTarget:(BaseCollectionViewController *)target;

-(void)leftItemClicked:(id)sender;
-(void)rightItemClicked:(id)sender;

@end
