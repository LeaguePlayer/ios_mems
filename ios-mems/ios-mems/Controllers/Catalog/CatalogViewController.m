//
//  CatalogViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "CatalogViewController.h"

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
}

-(void)initCategories{
    UIImage *image1 = [UIImage imageNamed:@"mem1.png"];
    UIImage *image2 = [UIImage imageNamed:@"mem2.png"];
    UIImage *image3 = [UIImage imageNamed:@"mem3.png"];
    categories = @{@"Раз":image1,@"Два":image2,@"Три":image3,@"Четыре":image1,@"Пять":image2,@"Шесть":image3,@"Семь":image1,@"Восемь":image2,@"Девять":image3};
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
    NSArray *keys = [categories allKeys];
    NSInteger row = indexPath.row;
    NSString *key = [keys objectAtIndex:row];
    [textLbl setText:key];
    [textLbl setAdjustsFontSizeToFitWidth:YES];
    UIImage *img = (UIImage *)[categories objectForKey:key];
    [imgView setImage:img];
    CGRect frame = imgView.frame;
    frame.size = img.size;
    frame.origin.x = cell.frame.size.width/2 - img.size.width/2;
    [imgView setFrame:frame];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
