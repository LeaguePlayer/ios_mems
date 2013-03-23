//
//  MemViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MemViewController.h"

@interface MemViewController ()

@end

@implementation MemViewController

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
    UIImage *image = [UIImage imageNamed:@"bg_papper.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    [self initPhotoItemWithTarget:self];
    [self initBackButtonWithTarget:self];
    image = [UIImage imageNamed:self.mem.fileName];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:image];
}

-(void)rightItemClicked:(id)sender{
    [self performSegueWithIdentifier:@"Background" sender:self];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
