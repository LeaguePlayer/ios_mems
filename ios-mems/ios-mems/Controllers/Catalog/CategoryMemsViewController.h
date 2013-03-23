//
//  MemsViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "MEMemCategory.h"
#import "MEMem.h"
#import <SSToolkit/SSCollectionView.h>

@interface CategoryMemsViewController : BaseViewController <SSCollectionViewDelegate, SSCollectionViewDataSource>{
    SSCollectionView *collectionView;
    MEMem *selected;
}

@property (nonatomic,retain) MEMemCategory *category;

@end
