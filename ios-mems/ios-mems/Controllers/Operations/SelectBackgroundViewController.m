//
//  SelectBackgroundViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "SelectBackgroundViewController.h"
#import "UIImage+Blank.h"
#import "BaseNavigationController.h"
#import "EditPhotoViewController.h"

@interface SelectBackgroundViewController ()

@end

@implementation SelectBackgroundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [((BaseNavigationController *)self.navigationController) initNavigationBarWithType:BaseNavigationTypeNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initBackButtonWithTarget:self];
    crop = NO;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_papper.png"]]];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectFromCamera:(id)sender {
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)selectFromGallery:(id)sender {
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)cropImage:(id)sender {
    crop = !crop;
    NSString *part = crop ? @"YES" : @"NO";
    NSString *title = [NSString stringWithFormat:@"CROP : %@",part];
    [((UIButton *)sender) setTitle:title forState:UIControlStateNormal];
}

-(void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] && [mediaTypes count] > 0){
        selectedSourceType = sourceType;
        [self performSegueWithIdentifier:@"Photo" sender:self];
    } else {
        [self showAlertWithStatus:@"Устройство не поддерживает этот тип содержимого"];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    resultImage = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *identifier = crop ? @"ToCrop" : @"Next";
    [self performSegueWithIdentifier:identifier sender:self];
}

-(void)colorPickerControllerDidFinish:(InfColorPickerController *)controller{
    resultColor = controller.resultColor;
    CGSize size = self.view.bounds.size;
    size.width += 1;
    [self performSegueWithIdentifier:@"Next" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Custom"]){
        InfColorPickerController *controller = (InfColorPickerController *)segue.destinationViewController;
        controller.sourceColor = [UIColor blueColor];
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"Next"]){
        EditPhotoViewController *controller = (EditPhotoViewController *)segue.destinationViewController;
        if (resultColor)
            controller.color = resultColor;
        else
            controller.image = resultImage;
    } else if ([segue.identifier isEqualToString:@"Photo"]){
        UIImagePickerController *controller = (UIImagePickerController *)segue.destinationViewController;
        controller.delegate = self;
        controller.sourceType = selectedSourceType;
    } else if ([segue.identifier isEqualToString:@"ToCrop"]){
        CropImageViewController *controller = (CropImageViewController *)segue.destinationViewController;
        controller.image = resultImage;
    }
}

#pragma mark - Crop image delegate method

-(void)cropImageViewController:(CropImageViewController *)controller imageCropped:(UIImage *)image{
    resultImage = image;
    [controller dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"Next" sender:self];
}

@end
