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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initCategories];
    [self initPhotoItemWithTarget:self];
    [self initInfoItemWithTarget:self];
    [self.navigationItem setTitle:@"Приложение"];
    [self initUI];
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

-(void)initCategories{
    categories = [MEMemCategory allCategories];
}

-(NSUInteger)numberOfSectionsInCollectionView:(SSCollectionView *)aCollectionView{
    return 1;
}

-(NSUInteger)collectionView:(SSCollectionView *)aCollectionView numberOfItemsInSection:(NSUInteger)section{
    return categories.count;
}

- (SSCollectionViewItem *)collectionView:(SSCollectionView *)aCollectionView itemForIndexPath:(NSIndexPath *)indexPath {
    static NSString *const itemIdentifier = @"itemIdentifier";
    
    SSCollectionViewItem *item = [aCollectionView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!item) {
		item = [[SSCollectionViewItem alloc] initWithStyle:SSCollectionViewItemStyleImage reuseIdentifier:itemIdentifier];
	}
    MEMemCategory *category = categories[indexPath.row];
    [item setBackgroundColor:[UIColor clearColor]];
    [item.imageView setImage:category.mainImage];
    [item.imageView setContentMode:UIViewContentModeScaleAspectFit];
    return item;
}

#pragma mark - SSCollectionViewDelegate

- (CGSize)collectionView:(SSCollectionView *)aCollectionView itemSizeForSection:(NSUInteger)section {
    return CGSizeMake(85.0f, 86.0f);
}

-(void)collectionView:(SSCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    selected = [categories objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Mems" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Mems"]){
        CategoryMemsViewController *controller = (CategoryMemsViewController *)segue.destinationViewController;
        controller.category = selected;
    }
}

@end
