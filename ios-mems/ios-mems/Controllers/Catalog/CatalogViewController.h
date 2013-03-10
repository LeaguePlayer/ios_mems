//
//  CatalogViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MEMemCategory.h"

@interface CatalogViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    MEMemCategory *selected;
    NSArray *categories;
}

@end
