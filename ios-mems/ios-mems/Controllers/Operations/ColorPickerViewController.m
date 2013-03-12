//
//  ColorPickerViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "ColorPickerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ColorPickerViewController ()

@end

@implementation ColorPickerViewController

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
    [self checkTheColor];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)checkTheColor{
    NSMutableArray *colors = [NSMutableArray array];
    for (UIButton *button in self.colors){
        [colors addObject:button.backgroundColor];
    }
    [self.display setColors:colors];
    [self.display setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseColor:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
