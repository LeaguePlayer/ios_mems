//
//  EditPhotoViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "EditPhotoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface EditPhotoViewController ()

@end

@implementation EditPhotoViewController

@synthesize currentView = _currentView;

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
    started = NO;
    undator = [[MECommandReciever alloc] init];
    images = [NSMutableArray array];
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
        DraggableImageView *imageView = [[DraggableImageView alloc] initWithImage:image];
        [imageView setDelegate:self];
        [imageView setTag:i + 1];
        CGSize size = CGSizeMake(44, 44);
        CGRect frame = CGRectMake(content, 3, 0, 0);
        frame.size = size;
        [imageView setFrame:frame];
        [imageView setUserInteractionEnabled:YES];
        [self.itemsScroll addSubview:imageView];
        [imageView setScrollParent:self.itemsScroll];
        [imageView setDestView:self.scroll];
        [imageView setMainView:self.view];
        content += 44 + 5;
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
    
    if ([(UIPanGestureRecognizer *)sender state] == UIGestureRecognizerStateEnded){
        
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
    self.currentView = [sender view];
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

-(void) touchEndedInRightWay:(DraggableImageView *)image{
    CGPoint location = [self.scroll convertPoint:image.center fromView:self.view];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image.image];
    CGRect frame = imageView.frame;
    frame.size = image.frame.size;
    [imageView setFrame:frame];
    imageView.center = location;
    UIPanGestureRecognizer *moving = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
    [moving setMaximumNumberOfTouches:1];
    [moving setMinimumNumberOfTouches:1];
    [moving setDelegate:self];
    [imageView addGestureRecognizer:moving];
    [imageView setUserInteractionEnabled:YES];
    [self.scroll addSubview:imageView];
    self.currentView = imageView;
    [undator pushCommand:[[MEAddCommand alloc] initWithView:self.currentView]];
}

-(void)moveImage:(id)sender{
    if (!started){
        UIView *view = [sender view];
        command = [[MEMoveCommand alloc] initWithView:view andPoint:view.center];
        started = YES;
    }
    if ([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded){
        started = NO;
        [undator pushCommand:command];
    }
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.scroll];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[sender view] setCenter:translatedPoint];
    self.currentView = [sender view];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    if (self.currentView){
        if (!started){
            command = [[METransformCommand alloc] initWithView:self.currentView andScale:self.currentView.transform];
            started = YES;
        }
        if (recognizer.state == UIGestureRecognizerStateEnded){
            started = NO;
            [undator pushCommand:command];
        }
        self.currentView.transform = CGAffineTransformScale(self.currentView.transform, recognizer.scale, recognizer.scale);
        recognizer.scale = 1;
    }
}

- (IBAction)deleteControl:(id)sender {
    if (!self.currentView) return;
    [self.currentView removeFromSuperview];
    [undator pushCommand:[[MERemoveCommand alloc] initWithView:self.currentView andSuperView:self.scroll]];
}

- (IBAction)undo:(id)sender {
    [undator undo];
}

- (IBAction)addText:(id)sender {
    [self performSegueWithIdentifier:@"AddText" sender:self];
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    if (self.currentView){
        if (!started){
            command = [[METransformCommand alloc] initWithView:self.currentView andScale:self.currentView.transform];
            started = YES;
        }
        if (recognizer.state == UIGestureRecognizerStateEnded){
            started = NO;
            [undator pushCommand:command];
        }
        self.currentView.transform = CGAffineTransformRotate(self.currentView.transform, recognizer.rotation);
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

-(BOOL)isInsideDestinationView:(DraggableImageView *)image touching:(BOOL)finished{
    return CGRectContainsPoint(self.scroll.frame, image.center);
}

-(void)touchDown{
    
}

-(void)touchUp{
    
}

#pragma mark - getters, setters

-(UIView*)currentView{
    return _currentView;
}

-(void)setCurrentView:(UIView *)currentView{
    if (self.currentView){
        _currentView.layer.borderColor = [UIColor clearColor].CGColor;
    }
    _currentView = currentView;
    if (currentView){
        _currentView.layer.borderColor = [UIColor redColor].CGColor;
        _currentView.layer.borderWidth = 1.0f;
    }
}

#pragma mark - InfColorPickerController

-(void)addTextPropertiesSelectedInController:(AddTextViewController *)controller{
    UILabel *text = [[UILabel alloc] init];
    [text setText:controller.text];
    [text setTextColor:controller.color];
    [text setFont:[UIFont systemFontOfSize:controller.size]];
    [text sizeToFit];
    [text setUserInteractionEnabled:YES];
    [text setBackgroundColor:[UIColor clearColor]];
    text.center = self.imageView.center;
    UIPanGestureRecognizer *moving = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
    [moving setMaximumNumberOfTouches:1];
    [moving setMinimumNumberOfTouches:1];
    [moving setDelegate:self];
    [text addGestureRecognizer:moving];
    [self.scroll addSubview:text];
    self.currentView = text;
    [undator pushCommand:[[MEAddCommand alloc] initWithView:self.currentView]];
}

#pragma mark - segue delegates

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AddTextViewController *controller = (AddTextViewController *)segue.destinationViewController;
    controller.delegate = self;
}

@end
