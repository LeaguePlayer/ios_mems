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
}

-(void)leftItemClicked:(id)sender{
    [self performSegueWithIdentifier:@"About" sender:self];
}

-(void)rightItemClicked:(id)sender{
    
}

-(void)initCategories{
    categories = [MEMemCategory categoriesMock];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return categories.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"MemCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    UILabel *textLbl = (UILabel *)[cell viewWithTag:1];
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:2];
    MEMemCategory *cat = [categories objectAtIndex:indexPath.row];
    [textLbl setText:cat.name];
    [textLbl setAdjustsFontSizeToFitWidth:YES];
    UIImage *img = (UIImage *)cat.image;
    [imgView setImage:img];
    CGRect frame = imgView.frame;
    frame.size = img.size;
    frame.origin.x = cell.frame.size.width/2 - img.size.width/2;
    [imgView setFrame:frame];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
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
