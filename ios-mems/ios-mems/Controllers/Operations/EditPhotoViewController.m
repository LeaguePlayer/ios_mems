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
    [self initUI];
}

-(void)initUI{
    [self initBackButtonWithTarget:self];
    [self initOptionsButtonWithTarget:self];
    [self initImageView];
    [self initItems];
    [self initActions];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_papper.png"]]];
}

-(void)initActions{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Выберите действие" delegate:self cancelButtonTitle:@"Отмена" destructiveButtonTitle:nil otherButtonTitles:@"Отправить ММС", @"Сохранить на телефон", nil];
}

-(void)initItems{
    self.items = [self orderCollectionByTagWithArray:self.items];
    for (UIButton *button in self.items){
        [button addTarget:self action:@selector(addMem:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton *button = [self.items lastObject];
    CGSize size = CGSizeMake(button.frame.origin.x + button.frame.size.width, self.itemsScroll.frame.size.height);
    [self.itemsScroll setContentSize:size];
}

-(void)initImageView{
    CGSize size = self.image.size;
    CGRect frame = self.imageView.frame;
    frame.size = size;
    [self.imageView setImage:self.image];
    [self.imageView setFrame:frame];
    frame = self.scroll.frame;
    frame.size.width = MIN(size.width, frame.size.width);
    frame.size.height = MIN(size.height, frame.size.height);
    frame.origin.x = self.view.frame.size.width/2 - frame.size.width/2;
    [self.scroll setFrame:frame];
    [self.scroll setContentSize:size];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightItemClicked:(id)sender{
    [actionSheet showInView:self.view];
}

-(void)addMem:(id)sender{
    UIButton *button = (UIButton *)sender;
    UIImage *image = button.imageView.image;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGRect frame = imageView.frame;
    frame.size = image.size;
    [imageView setFrame:frame];
    UIPanGestureRecognizer *moving = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
    [moving setMaximumNumberOfTouches:1];
    [moving setMinimumNumberOfTouches:1];
    [moving setDelegate:self];
    [imageView addGestureRecognizer:moving];
    [imageView setUserInteractionEnabled:YES];
    [self.scroll addSubview:imageView];
}

-(void)moveImage:(id)sender{
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.scroll];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
