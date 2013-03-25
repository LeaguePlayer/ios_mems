//
//  AddTextViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "AddTextViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddTextViewController ()

@end

@implementation AddTextViewController

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
    self.selectColorButton.layer.cornerRadius = 4.0f;
    self.text = @"";
    self.color = [UIColor blackColor];
    self.size = 17.0f;
    self.fontSize.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.fontSize.returnKeyType = UIReturnKeyDone;
    self.textField.returnKeyType = UIReturnKeyDone;
    [self.textField setText:self.text];
    [self.fontSize setText:[NSString stringWithFormat:@"%0.f",self.size]];
    [self.selectColorButton setBackgroundColor:self.color];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_papper.png"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectColor:(id)sender {
    [self performSegueWithIdentifier:@"SelectColor" sender:self];
}

- (IBAction)selectProperties:(id)sender {
    [currentView resignFirstResponder];
    self.text = self.textField.text;
    self.size = self.fontSize.text.floatValue;
    if ([self.delegate respondsToSelector:@selector(addTextPropertiesSelectedInController:)] && ![self.text isEqualToString:@""]){
        [self.delegate addTextPropertiesSelectedInController:self];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)discardView:(id)sender {
    [currentView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    InfColorPickerController *controller = (InfColorPickerController *)segue.destinationViewController;
    controller.delegate = self;
}

-(void)colorPickerControllerDidFinish:(InfColorPickerController *)controller{
    self.color = controller.resultColor;
    [self.selectColorButton setBackgroundColor:self.color];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    currentView = textField;
}

@end
