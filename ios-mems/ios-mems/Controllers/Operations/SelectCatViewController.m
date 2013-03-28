//
//  SelectCatViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 28.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "SelectCatViewController.h"

@interface SelectCatViewController ()

@end

@implementation SelectCatViewController

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
    categories = [MEMemCategory allCategories];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return categories.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    MEMemCategory *category = [categories objectAtIndex:row];
    return category.name;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectedCategory = [categories objectAtIndex:row];
}

-(IBAction)tapRecognized:(id)sender{
    [self.delegate categorySelected:selectedCategory];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
