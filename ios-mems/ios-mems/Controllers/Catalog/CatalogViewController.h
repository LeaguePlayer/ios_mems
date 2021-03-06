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
#import "MEMem.h"

typedef enum {
    CatalogOutputModeCatalog,
    CatalogOutputModeFavourites,
    CatalogOutputModeRecents
} CatalogOutputMode;

@interface CatalogViewController : BaseViewController<SSCollectionViewDataSource,SSCollectionViewDelegate>{
    MEMemCategory *selectedCategory;
    MEMem *selectedMem;
    NSArray *favourites;
    NSArray *recents;
    SSCollectionView *collectionView;
    CatalogOutputMode currentMode;
    NSArray *categories;
}
- (IBAction)tabBarClicked:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tabBarItems;


@end
