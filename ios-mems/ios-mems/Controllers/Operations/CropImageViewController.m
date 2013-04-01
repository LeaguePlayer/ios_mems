//
//  CropImageViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 01.04.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "CropImageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "EditPhotoViewController.h"

@interface CropImageViewController ()

@end

@implementation CropImageViewController

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
    [self initPhotoItemWithTarget:self];
    [self.imageView setImage:self.image];
    startPoint = CGPointMake(0, 0);
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightItemClicked:(id)sender{
    if (!frame){
        resultImage = self.image;
        [self performSegueWithIdentifier:@"ToEdit" sender:self];
    } else {
        UIGraphicsBeginImageContext(self.imageView.bounds.size);
        [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], frame.frame);
        resultImage = [UIImage imageWithCGImage:imageRef];
        [self performSegueWithIdentifier:@"ToEdit" sender:self];
        CGImageRelease(imageRef);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [frame removeFromSuperview];
    UITouch *touch = [[event touchesForView:self.view] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    startPoint = location;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event touchesForView:self.view] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    CGRect rect = CGRectMake(startPoint.x, startPoint.y, location.x - startPoint.x, location.y - startPoint.y);
    [frame removeFromSuperview];
    frame = [[UIView alloc] initWithFrame:rect];
    frame.layer.borderWidth = 2;
    frame.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:frame];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ToEdit"]){
        EditPhotoViewController *controller = (EditPhotoViewController *)segue.destinationViewController;
        controller.image = resultImage;
    }
}

@end
