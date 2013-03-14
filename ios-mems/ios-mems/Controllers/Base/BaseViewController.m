//
//  BaseViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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

-(void)initInfoItemWithTarget:(BaseViewController *)target{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [button addTarget:target action:@selector(leftItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    item.style = UIBarButtonItemStyleBordered;
    [self.navigationItem setLeftBarButtonItem:item];
}

-(void)initPhotoItemWithTarget:(BaseViewController *)target{
    UIImage *image = [UIImage imageNamed:@"photo_button.png"];
    CGRect frame = CGRectMake(0,0,image.size.width,image.size.height);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:@selector(rightItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:item];
}

-(void)initBackButtonWithTarget:(BaseViewController *)target{
    UIImage *image = [UIImage imageNamed:@"back_button.png"];
    CGRect frame = CGRectMake(0,0,image.size.width,image.size.height);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:@selector(leftItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setLeftBarButtonItem:item];
}

-(void)initOptionsButtonWithTarget:(BaseViewController *)target{
    UIImage *image = [UIImage imageNamed:@"open_button.png"];
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

-(void)showAlertWithStatus:(NSString *)title{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

-(NSArray *)orderCollectionByTagWithArray:(NSArray *)array{
    return [array sortedArrayUsingComparator:^NSComparisonResult(id objA, id objB){
        return(
               ([objA tag] < [objB tag]) ? NSOrderedAscending  :
               ([objA tag] > [objB tag]) ? NSOrderedDescending :
               NSOrderedSame);
    }];
}

@end
