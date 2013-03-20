//
//  CatalogViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSToolkit/SSCollectionView.h>
#import <SSToolkit/SSLabel.h>
#import "BaseViewController.h"
#import "MEMemCategory.h"

@interface CatalogViewController : BaseViewController<SSCollectionViewDataSource,SSCollectionViewDelegate>{
    MEMemCategory *selected;
    NSArray *categories;
    SSCollectionView *collectionView;
}

@end
