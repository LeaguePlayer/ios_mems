//
//  EditPhotoViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "EditPhotoViewController.h"

@interface EditPhotoViewController ()

@end

@implementation EditPhotoViewController

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
    [self initOptionsButtonWithTarget:self];
    [self initImageView];
    [self initItems];
    [self initActions];
}

-(void)initActions{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Выберите действие" delegate:self cancelButtonTitle:@"Отмена" destructiveButtonTitle:nil otherButtonTitles:@"Отправить ММС", @"Сохранить на телефон", nil];
}

-(void)initItems{
    self.items = [self orderCollectionByTagWithArray:self.items];
    UIButton *button = [self.items lastObject];
    CGSize size = CGSizeMake(button.frame.origin.x + button.frame.size.width, self.itemsScroll.frame.size.height);
    [self.itemsScroll setContentSize:size];
}

-(void)initImageView{
    CGSize size = self.image.size;
    CGRect frame = self.imageView.frame;
    frame.size = size;
    [self.imageView setFrame:frame];
    [self.imageView setImage:self.image];
    [self.scroll setContentSize:size];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightItemClicked:(id)sender{
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
