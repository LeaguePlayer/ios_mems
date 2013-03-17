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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initBackButtonWithTarget:self];
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
    resultImage = [image imageCroppedToFitSize:CGSizeMake(600, 600)];
    [self performSegueWithIdentifier:@"Next" sender:self];
}

-(void)colorPickerControllerDidFinish:(InfColorPickerController *)controller{
    UIColor *resultColor = controller.resultColor;
    UIImage *image = [UIImage blankImage:self.view.bounds.size withColor:resultColor];
    resultImage = image;
    [self performSegueWithIdentifier:@"Next" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Custom"]){
        InfColorPickerController *controller = (InfColorPickerController *)segue.destinationViewController;
        controller.sourceColor = [UIColor blueColor];
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"Next"]){
        [((BaseNavigationController *)self.navigationController) initNavigationBarWithType:BaseNavigationTypeEditPhoto];
        EditPhotoViewController *controller = (EditPhotoViewController *)segue.destinationViewController;
        controller.image = resultImage;
    } else if ([segue.identifier isEqualToString:@"Photo"]){
        UIImagePickerController *controller = (UIImagePickerController *)segue.destinationViewController;
        controller.delegate = self;
        controller.sourceType = selectedSourceType;
    }
}

@end
