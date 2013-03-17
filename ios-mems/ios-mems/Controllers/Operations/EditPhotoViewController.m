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
    CGFloat content = 0;
    for (int i = 0; i <= 50; i++){
        NSString *name = [NSString stringWithFormat:@"mem-for-edit-%d.png",i];
        UIImage *image = [UIImage imageNamed:name];
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setImage:image forState:UIControlStateNormal];
//        [button setTag:i + 1];
//        [button addTarget:self action:@selector(addMem:withEvent:) forControlEvents:UIControlEventTouchDragInside];
//        CGSize size = CGSizeMake(44, 44);
//        CGRect frame = CGRectMake(content, 3, 0, 0);
//        frame.size = size;
//        [button setFrame:frame];
//        [self.itemsScroll addSubview:button];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setTag:i + 1];
        CGSize size = CGSizeMake(44, 44);
        CGRect frame = CGRectMake(content, 3, 0, 0);
        frame.size = size;
        [imageView setFrame:frame];
        [imageView setUserInteractionEnabled:YES];
        [self.itemsScroll addSubview:imageView];
        content += 44 + 5;
        UIPanGestureRecognizer *panrec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(startDragging:)];
        [imageView addGestureRecognizer:panrec];
    }
    content -= 5;
    CGSize size = CGSizeMake(content, self.itemsScroll.frame.size.height);
    [self.itemsScroll setContentSize:size];
}

-(void)startDragging:(id)sender{
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        UIImageView *imageView = (UIImageView *)[sender view];
        UIScrollView *superView = (UIScrollView *)[imageView superview];
        firstX = [[sender view] center].x - superView.contentOffset.x + superView.frame.origin.x;
        firstY = [[sender view] center].y - superView.contentOffset.y + superView.frame.origin.y;
        CGRect frame = imageView.frame;
        frame.origin = CGPointMake(firstX, firstY);
        [imageView setFrame:frame];
        [imageView removeFromSuperview];
        [self.view addSubview:imageView];
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
    currentView = [sender view];
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

-(void)addMem:(id)sender withEvent:(UIEvent *)event{
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
    currentView = imageView;
}

-(void)moveImage:(id)sender{
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.scroll];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
    currentView = [sender view];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    if (currentView){
        currentView.transform = CGAffineTransformScale(currentView.transform, recognizer.scale, recognizer.scale);
        recognizer.scale = 1;
    }
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    if (currentView){
        currentView.transform = CGAffineTransformRotate(currentView.transform, recognizer.rotation);
        recognizer.rotation = 0;
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
