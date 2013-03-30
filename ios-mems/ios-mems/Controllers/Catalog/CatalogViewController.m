//
//  CatalogViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "CatalogViewController.h"
#import "BaseNavigationController.h"
#import "CategoryMemsViewController.h"
#import "MemViewController.h"
#import "FavouriteMem.h"
#import "MECategoryItem.h"

@interface CatalogViewController ()

@end

@implementation CatalogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createStored];
    [collectionView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initContent];
    [self initPhotoItemWithTarget:self];
    [self initInfoItemWithTarget:self];
    [self.navigationItem setTitle:@"Приложение"];
    currentMode = CatalogOutputModeCatalog;
    [self initUI];
    [self initTabBarItems];
}

-(void)initTabBarItems{
    self.tabBarItems = [self orderCollectionByTagWithArray:self.tabBarItems];
    UIButton *first = [self.tabBarItems objectAtIndex:0];
    UIButton *second = [self.tabBarItems objectAtIndex:1];
    UIButton *third = [self.tabBarItems objectAtIndex:2];
    [first setImage:[UIImage imageNamed:@"tab1.png"] forState:UIControlStateNormal];
    [first setImage:[UIImage imageNamed:@"tab1_current.png"] forState:UIControlStateSelected];
    [second setImage:[UIImage imageNamed:@"tab2.png"] forState:UIControlStateNormal];
    [second setImage:[UIImage imageNamed:@"tab2_current.png"] forState:UIControlStateSelected];
    [third setImage:[UIImage imageNamed:@"tab3.png"] forState:UIControlStateNormal];
    [third setImage:[UIImage imageNamed:@"tab3_current.png"] forState:UIControlStateSelected];
    
}

-(void)initContent{
    categories = [MEMemCategory allCategories];
}


-(void)createStored{
    NSArray *favs = [FavouriteMem favouriteMems];
    NSMutableArray *mfa = [NSMutableArray array];
    for (FavouriteMem *mem in favs){
        MEMem *new = [MEMem memFromManagedOne:mem];
        [mfa addObject:new];
    }
    favourites = mfa;
    NSArray *rec = [FavouriteMem recentMems];
    NSMutableArray *mrec = [NSMutableArray array];
    for (FavouriteMem *mem in rec){
        MEMem *new = [MEMem memFromManagedOne:mem];
        [mrec addObject:new];
    }
    recents = mrec;
}

-(void)initUI{
    [self initCollectionView];
}

-(void)initCollectionView{
    collectionView = [[SSCollectionView alloc] init];
    [collectionView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 55)];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:collectionView];
}

-(void)leftItemClicked:(id)sender{
    [self performSegueWithIdentifier:@"About" sender:self];
}

-(void)rightItemClicked:(id)sender{
    [self performSegueWithIdentifier:@"Background" sender:self];
}

-(NSUInteger)numberOfSectionsInCollectionView:(SSCollectionView *)aCollectionView{
    return 1;
}

-(NSUInteger)collectionView:(SSCollectionView *)aCollectionView numberOfItemsInSection:(NSUInteger)section{
    int count = 0;
    switch (currentMode) {
        case CatalogOutputModeCatalog:
            count = categories.count;
            break;
        case CatalogOutputModeFavourites:
            count = favourites.count;
            break;
        case CatalogOutputModeRecents:
            count = recents.count;
            break;
        default:
            count = categories.count;
            break;
    }
    return count;
}

-(CGFloat)collectionView:(SSCollectionView *)aCollectionView heightForHeaderInSection:(NSUInteger)section{
    return 20;
}

-(UIView *)collectionView:(SSCollectionView *)aCollectionView viewForHeaderInSection:(NSUInteger)section{
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (SSCollectionViewItem *)collectionView:(SSCollectionView *)aCollectionView itemForIndexPath:(NSIndexPath *)indexPath {
    static NSString *const itemIdentifier = @"itemIdentifier";
    SSCollectionViewItem *item;
    
    if (currentMode == CatalogOutputModeCatalog){
        MECategoryItem *catItem = [[MECategoryItem alloc] initWithReuseIdentifier:itemIdentifier];
        MEMemCategory *category = categories[indexPath.row];
        [catItem.iconView setImage:category.mainImage];
        [catItem.titleLbl setText:category.name];
        item = catItem;
    } else {
        if (!item) {
            item = [[SSCollectionViewItem alloc] initWithStyle:SSCollectionViewItemStyleImage reuseIdentifier:itemIdentifier];
        }
        NSArray *array = (currentMode == CatalogOutputModeFavourites) ? favourites : recents;
        MEMem *mem = [array objectAtIndex:indexPath.row];
        UIImage *image = [UIImage imageNamed:mem.fileName];
        [item.imageView setImage:image];
    }
    [item setBackgroundColor:[UIColor clearColor]];
    [item.imageView setContentMode:UIViewContentModeScaleAspectFit];
    return item;
}

#pragma mark - SSCollectionViewDelegate

- (CGSize)collectionView:(SSCollectionView *)aCollectionView itemSizeForSection:(NSUInteger)section {
    return CGSizeMake(95.0f, 99.0f);
}

-(void)collectionView:(SSCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (currentMode == CatalogOutputModeCatalog){
        selectedCategory = [categories objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"Mems" sender:self];
    } else {
        NSArray *array = (currentMode == CatalogOutputModeFavourites) ? favourites : recents;
        selectedMem = [array objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"Mem" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Mems"]){
        CategoryMemsViewController *controller = (CategoryMemsViewController *)segue.destinationViewController;
        controller.category = selectedCategory;
    } else if ([segue.identifier isEqualToString:@"Mem"]){
        MemViewController *controller = (MemViewController *)segue.destinationViewController;
        controller.mem = selectedMem;
    }
}

- (IBAction)tabBarClicked:(id)sender {
    int tag = [sender tag];
    CatalogOutputMode newMode;
    switch (tag) {
        case 1:
            newMode = CatalogOutputModeCatalog;
            break;
        case 2:
            newMode = CatalogOutputModeFavourites;
            break;
        case 3:
            newMode = CatalogOutputModeRecents;
            break;
        default:
            newMode = CatalogOutputModeCatalog;
            break;
    }
    if (newMode == currentMode) return;
    for (UIButton *butt in self.tabBarItems){
        [butt setSelected:NO];
    }
    [((UIButton *)sender) setSelected:YES];
    [self createStored];
    currentMode = newMode;
    [collectionView reloadData];
}

@end
