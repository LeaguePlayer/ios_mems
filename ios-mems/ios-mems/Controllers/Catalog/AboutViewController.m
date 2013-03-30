//
//  AboutViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "AboutViewController.h"
#import "SHK.h"
#import "SHKFacebook.h"
#import "SHKVkontakte.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    [self initBackButtonWithTarget:self];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_papper.png"]];
//    [self initPhotoItemWithTarget:self];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fbShare:(id)sender {
	UIImage *image = [UIImage imageNamed:@"mem.png"];
	SHKItem *item = [SHKItem image:image title:@"Отличное приложение для iPhone, рекомендую!"];
    
    [SHKFacebook shareItem:item];
}

- (IBAction)vkShare:(id)sender {
    UIImage *image = [UIImage imageNamed:@"mem.png"];
    SHKItem *item = [SHKItem image:image title:@"Отличное приложение для iPhone, рекомендую!"];
    
    [SHKVkontakte shareItem:item];
}
@end
