//
//  MemsViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "MEMemCategory.h"

@interface CategoryMemsViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic,retain) MEMemCategory *category;

@end
