//
//  MemViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MemViewController.h"
#import "MEUtils.h"

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
    }п
    NSString *title = [self.mem isFavourite] ? @"Удалить из избранного" : @"Добавить в избранное";
    [self.favouriteBtn setTitle:title forState:UIControlStateNormal];
}

- (IBAction)sendMessage:(id)sender {
    if ([MFMessageComposeViewController canSendText]){
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:self.mem.fileName]);
        [pasteboard setData:imageData forPasteboardType:@"public.jpeg"];
        MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    } else {
        [self showAlertWithStatus:@"Устройство не поддерживает данную функциональность"];
    }
}

- (IBAction)saeImage:(id)sender {
    [MEUtils saveImageToGallery:[UIImage imageNamed:self.mem.fileName]];
    [self showAlertWithStatus:@"Изображение сохранено!"];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
