//
//  CatalogViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewController.h"

@interface CatalogViewController : BaseCollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate>{
    NSDictionary *categories;
}

@end
