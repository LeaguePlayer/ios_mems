//
//  BaseTabBarController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

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
    [self initBar];
}

-(void)initBar{
    UIImage *background = [UIImage imageNamed:@"bar-back.png"];
    [self.tabBar setBackgroundImage:background];
    [self.tabBar setTintColor:[UIColor colorWithRed:0 green:0.13 blue:0.4 alpha:1]];
    [self.tabBar setSelectedImageTintColor:[UIColor blueColor]];
    [self.tabBar setSelectionIndicatorImage:[[UIImage alloc] init]];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
