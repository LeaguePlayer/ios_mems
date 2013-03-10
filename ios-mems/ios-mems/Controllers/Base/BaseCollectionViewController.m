//
//  BaseCollectionViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

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
}

-(void)initInfoItemWithTarget:(BaseCollectionViewController *)target{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [button addTarget:target action:@selector(leftItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    item.style = UIBarButtonItemStyleBordered;
    [self.navigationItem setLeftBarButtonItem:item];
}

-(void)initPhotoItemWithTarget:(BaseCollectionViewController *)target{
    UIImage *image = [UIImage imageNamed:@"photo_button.png"];
    CGRect frame = CGRectMake(0,0,image.size.width,image.size.height);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:@selector(rightItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:item];
}

-(void)leftItemClicked:(id)sender{
    
}

-(void)rightItemClicked:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
