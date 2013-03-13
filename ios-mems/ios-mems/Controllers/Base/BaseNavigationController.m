//
//  BaseNavigationController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

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
    [self initNavigationBarWithType:BaseNavigationTypeNormal];
}

-(void)initNavigationBarWithType:(BaseNavigationType)type{
    UIImage *background;
    switch (type) {
        case BaseNavigationTypeNormal:
            background = [UIImage imageNamed:@"top_bar.png"];
            break;
        case BaseNavigationTypeEditPhoto:
            background = [UIImage imageNamed:@"edit_photo_navbar.png"];
            break;
        default:
            background = [UIImage imageNamed:@"top_bar.png"];
            break;
    }
    [self.navigationBar setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], UITextAttributeTextColor,[UIFont fontWithName:@"v_bd_cartoon_shout_cyr" size:16.0], UITextAttributeFont,nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
