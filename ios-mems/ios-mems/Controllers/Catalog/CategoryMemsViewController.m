//
//  MemsViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "CategoryMemsViewController.h"
#import "MemViewController.h"
#import "MEMem.h"
#import "MemViewController.h"

@interface CategoryMemsViewController ()

@end

@implementation CategoryMemsViewController

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
    [self initUI];
}

-(void)initUI{
    [self initBackButtonWithTarget:self];
    [self initPhotoItemWithTarget:self];
    [self initCollectionView];
}

-(void)initCollectionView{
    collectionView = [[SSCollectionView alloc] init];
    [collectionView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 30)];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:collectionView];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightItemClicked:(id)sender{
    [self performSegueWithIdentifier:@"Background" sender:self];
}

-(NSUInteger)collectionView:(SSCollectionView *)aCollectionView numberOfItemsInSection:(NSUInteger)section{
    return self.category.mems.count;
}

-(NSUInteger)numberOfSectionsInCollectionView:(SSCollectionView *)aCollectionView{
    return 1;
}

-(SSCollectionViewItem *)collectionView:(SSCollectionView *)aCollectionView itemForIndexPath:(NSIndexPath *)indexPath{
    static NSString *const itemIdentifier = @"itemIdentifier";
    
    SSCollectionViewItem *item = [aCollectionView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!item) {
		item = [[SSCollectionViewItem alloc] initWithStyle:SSCollectionViewItemStyleImage reuseIdentifier:itemIdentifier];
	}
    MEMem *mem = self.category.mems[indexPath.row];
    [item setBackgroundColor:[UIColor clearColor]];
    UIImage *image = [UIImage imageNamed:mem.fileName];
    [item.imageView setImage:image];
    [item.imageView setContentMode:UIViewContentModeScaleAspectFit];
    return item;
}

#pragma mark - SSCollectionViewDelegate

- (CGSize)collectionView:(SSCollectionView *)aCollectionView itemSizeForSection:(NSUInteger)section {
    return CGSizeMake(85.0f, 86.0f);
}

-(void)collectionView:(SSCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    selected = [self.category.mems objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Mem" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MemViewController *controller = (MemViewController *)segue.destinationViewController;
    controller.mem = selected;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
