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
    [self addToRecents];
    [self initUI];
}

-(void)addToRecents{
    if (![self.mem isRecent]){
        [self.mem addToRecent];
    }
}

-(void)initUI{
    UIImage *image = [UIImage imageNamed:@"bg_papper.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    [self initPhotoItemWithTarget:self];
    [self initBackButtonWithTarget:self];
    image = [UIImage imageNamed:self.mem.fileName];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:image];
    NSString *title = [self.mem isFavourite] ? @"Убрать из избранного" : @"Добавить в избранное";
    [self.favouriteBtn setTitle:title forState:UIControlStateNormal];
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

- (IBAction)toFavourite:(id)sender {
    if ([self.mem isFavourite]){
        [self.mem removeFromFavourites];
    } else {
        [self.mem addToFavourites];
    }
    NSString *title = [self.mem isFavourite] ? @"Удалить из избранного" : @"Добавить в избранное";
    [self.favouriteBtn setTitle:title forState:UIControlStateNormal];
}

- (IBAction)sendMessage:(id)sender {
//    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
//    [controller setMessageComposeDelegate:self];
//    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//    pasteboard.persistent = YES;
//    pasteboard.image = [UIImage imageNamed:self.mem.fileName];
}

@end
