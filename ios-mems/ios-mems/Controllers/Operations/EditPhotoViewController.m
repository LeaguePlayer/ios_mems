//
//  EditPhotoViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "EditPhotoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Blank.h"
#import "MEUtils.h"
#import "MEMemCategory.h"
#import "MEMem.h"
#import "BaseNavigationController.h"

@interface EditPhotoViewController ()

@end

@implementation EditPhotoViewController

@synthesize currentView = _currentView;
@synthesize selectedCategory = _selectedCategory;

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [((BaseNavigationController *)self.navigationController) initNavigationBarWithType:BaseNavigationTypeEditPhoto];
}

-(void)initUI{
    [self initBackButtonWithTarget:self];
    [self initOptionsButtonWithTarget:self];
    if (self.color)
        [self initColor];
    else
        [self initImageView];
    [self initItems];
    [self initActions];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_papper.png"]]];
}

-(void)initColor{
    [self.scroll setBackgroundColor:self.color];
}

-(void)initActions{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Выберите действие" delegate:self cancelButtonTitle:@"Отмена" destructiveButtonTitle:nil otherButtonTitles:@"Отправить ММС", @"Сохранить на телефон", nil];
}

-(void)updateItems{
    for (UIView *view in self.itemsScroll.subviews){
        if ([view isMemberOfClass:[DraggableImageView class]]){
            [view removeFromSuperview];
        }
    }
    MEMemCategory *cat = [categories objectAtIndex:self.selectedCategory];
    CGFloat content = 0;
    for (int i = 0; i < cat.mems.count; i++){
        MEMem *mem = [cat.mems objectAtIndex:i];
        NSString *name = mem.fileName;
        UIImage *image = [UIImage imageNamed:name];
        DraggableImageView *imageView = [[DraggableImageView alloc] initWithImage:image];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
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

-(void)initItems{
    categories = [MEMemCategory allCategories];
    MEMemCategory *all = [[MEMemCategory alloc] initWithName:@"All" image:[[UIImage alloc] init]];
    NSMutableArray *mems = [NSMutableArray array];
    for (MEMemCategory *cat in categories){
        for (MEMem *mem in cat.mems){
            [mems addObject:mem];
        }
    }
    all.mems = mems;
    NSMutableArray *cats = [NSMutableArray arrayWithObject:all];
    [cats addObjectsFromArray:categories];
    categories = cats;
    self.selectedCategory = 0;
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
    CGFloat startY = self.topView.frame.origin.y + self.topView.frame.size.height;
    CGRect required = CGRectMake(0, startY, self.view.bounds.size.width, self.botomView.frame.origin.y - startY);
    CGSize size = self.image.size;
    CGRect frame = self.imageView.frame;
    frame.size = size;
    [self.imageView setImage:self.image];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    frame = self.scroll.frame;
    frame.size = self.imageView.frame.size;
    frame.origin.x = required.size.width/2 - frame.size.width/2;
    frame.origin.y = (self.botomView.frame.origin.y + startY)/2 - frame.size.height/2;
    [self.scroll setFrame:frame];
}

-(CGSize)sizeWithImage:(UIImage *)image constrainedToSize:(CGSize)maxSize{
    CGSize size = image.size;
    CGFloat newHeight = size.height;
    CGFloat newWidth = size.width;
    CGFloat factor = 1;
    if (newWidth > maxSize.width){
        factor = maxSize.width/newWidth;
    }
    newHeight = newHeight*factor;
    newWidth = newWidth*factor;
    factor = 1;
    if (newHeight > maxSize.height){
        factor = maxSize.height/newHeight;
    }
    CGSize newSize;
    newSize.width = newWidth*factor;
    newSize.height = newHeight*factor;
    return newSize;
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
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    CGRect frame = imageView.frame;
    CGSize size = image.image.size;
    size.height = size.height/2;
    size.width = size.width/2;
    frame.size = size;
    [imageView setFrame:frame];
    imageView.center = location;
    UILongPressGestureRecognizer *moving = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
    [moving setMinimumPressDuration:0.0];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [tap setNumberOfTapsRequired:1];
    tap.delegate = self;
    [imageView addGestureRecognizer:tap];
    [imageView addGestureRecognizer:moving];
    [imageView setUserInteractionEnabled:YES];
    [self.scroll addSubview:imageView];
    self.currentView = imageView;
    [undator pushCommand:[[MEAddCommand alloc] initWithView:self.currentView]];
}

-(void)moveImage:(UILongPressGestureRecognizer *)sender{
    if (!started){
        UIView *view = [sender view];
        command = [[MEMoveCommand alloc] initWithView:view andPoint:view.center];
        started = YES;
    }
    if ([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded){
        started = NO;
        [undator pushCommand:command];
    }
    CGPoint translatedPoint = [(UILongPressGestureRecognizer*)sender locationInView:self.scroll];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        firstX = sender.view.center.x - translatedPoint.x;
        firstY = sender.view.center.y - translatedPoint.y;
    }
    
    translatedPoint = CGPointMake(translatedPoint.x, translatedPoint.y);
    [[sender view] setCenter:CGPointMake(translatedPoint.x + firstX, translatedPoint.y + firstY)];
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

- (IBAction)undo:(id)sender { //оказывается, это горизонтальное зеркальное отображение объекта
//    [undator undo]; //оставим шаблон Командo до лучших времен
    if ([self.currentView isKindOfClass:[UIImageView class]]){
        UIImageView *imageView = (UIImageView *)self.currentView;
        UIImage *image = imageView.image;
        UIImageOrientation orientation = image.imageOrientation;
        UIImageOrientation newOrientation = orientation == UIImageOrientationUp ? UIImageOrientationUpMirrored : UIImageOrientationUp;
        
        UIImage *newImage = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:newOrientation];
        [imageView setImage:newImage];
    }
}

- (IBAction)addText:(id)sender {
    [self performSegueWithIdentifier:@"AddText" sender:self];
}

- (IBAction)selectCategory:(id)sender {
    [self.pickerView setAlpha:0.0];
    [self.pickerView setFrame:self.view.frame];
    CGRect frame = self.categoryPicker.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    [UIView animateWithDuration:0.4 animations:^{
        [self.pickerView setAlpha:0.5];
        [self.categoryPicker setFrame:frame];
    }];
//    [self performSegueWithIdentifier:@"SelectCategory" sender:self];
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

- (IBAction)showHelp:(id)sender {
    UIImageView *helpView = [[UIImageView alloc] init];
    UIImage *image;
    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes){
        image = [UIImage imageNamed:@"help_iphone5.png"];
    } else {
        image = [UIImage imageNamed:@"help.png"];
    }
    [helpView setImage:image];
    [helpView setUserInteractionEnabled:YES];
    [helpView setFrame:CGRectMake(0, self.view.frame.size.height, image.size.width, image.size.height)];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissHelpView:)];
    [helpView addGestureRecognizer:recognizer];
    [self.view addSubview:helpView];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = helpView.frame;
        frame.origin.y = 0;
        [helpView setFrame:frame];
    }];
}

-(void)dismissHelpView:(UITapGestureRecognizer *)sender{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect frame = sender.view.frame;
        frame.origin.y = self.view.frame.size.height;
        [sender.view setFrame:frame];
    } completion:^(BOOL finished) {
        [sender.view removeFromSuperview];
    }];
}

#pragma mark - action sheet delegate methods

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 2) return;
    [self setCurrentView:nil];
    UIGraphicsBeginImageContext(self.scroll.bounds.size);
    [self.scroll.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (buttonIndex == 0){
        if ([MFMessageComposeViewController canSendText]){
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.persistent = YES;
            NSData *imageData = UIImagePNGRepresentation(image);
            [pasteboard setData:imageData forPasteboardType:@"public.jpeg"];
            NSString *phoneToCall = @"sms:";
            NSURL *url = [[NSURL alloc] initWithString:phoneToCall];
            [[UIApplication sharedApplication] openURL:url];
        } else {
            [self showAlertWithStatus:@"Устройство не обладает такой функциональностью"];
        }
    } else {
        [MEUtils saveImageToGallery:image];
        [self showAlertWithStatus:@"Изображение сохранено!"];
    }
}

#pragma mark - message composer delegate methods

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

- (IBAction)categorySelected:(UITapGestureRecognizer *)sender{
    self.selectedCategory = selectedPickerItem;
    CGRect pframe = self.categoryPicker.frame;
    pframe.origin.y = self.view.frame.size.height;
    [UIView animateWithDuration:0.4 animations:^{
        [self.pickerView setAlpha:0];
        [self.categoryPicker setFrame:pframe];
    } completion:^(BOOL finished) {
        CGRect frame = self.view.frame;
        frame.origin.y = frame.size.height;
        [self.pickerView setFrame:frame];
    }];
}

#pragma mark - picker view data source methods

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return categories.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    MEMemCategory *cat = [categories objectAtIndex:row];
    return cat.name;
}

#pragma mark - picker view delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectedPickerItem = row;
}

#pragma mark - getters, setters

-(UIView*)currentView{
    return _currentView;
}

-(int)selectedCategory{
    return _selectedCategory;
}

-(void)setSelectedCategory:(int)selectedCategory{
    _selectedCategory = selectedCategory;
    [self updateItems];
}

-(void)setCurrentView:(UIView *)acurrentView{
    if (self.currentView){
        _currentView.layer.borderColor = [UIColor clearColor].CGColor;
    }
    _currentView = acurrentView;
    if (acurrentView){
        _currentView.layer.borderColor = [UIColor redColor].CGColor;
        _currentView.layer.borderWidth = 1.0f;
        [self.scroll bringSubviewToFront:_currentView];
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
    [moving setDelaysTouchesBegan:NO];
    [text addGestureRecognizer:moving];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [tap setNumberOfTapsRequired:1];
    tap.delegate = self;
    [text addGestureRecognizer:tap];
    [self.scroll addSubview:text];
    self.currentView = text;
    [undator pushCommand:[[MEAddCommand alloc] initWithView:self.currentView]];
}

-(void)imageTap:(UITapGestureRecognizer *)sender{
    UIView *view = [sender view];
    [self setCurrentView:view];
}

#pragma mark - segue delegate methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AddText"]){
        AddTextViewController *controller = (AddTextViewController *)segue.destinationViewController;
        controller.delegate = self;
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
