//
//  AboutViewController.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "AboutViewController.h"
#import "SHK.h"
#import "SHKFacebook.h"
#import "SHKVkontakte.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_papper.png"]];
    [self initLabels];
}

-(void)initLabels{
    [self.titleLabel setFont:[UIFont fontWithName:@"v_BD_Cartoon_Shout Cyr" size:20]];
    UIFont *font = [UIFont fontWithName:@"a_DomIno" size:17];
    [self.versionLabel setFont:font];
    [self.infoLabel setFont:font];
}

-(void)leftItemClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fbShare:(id)sender {
	UIImage *image = [UIImage imageNamed:@"mem.png"];
	SHKItem *item = [SHKItem image:image title:@"Отличное приложение для iPhone, рекомендую!"];
    
    [SHKFacebook shareItem:item];
}

- (IBAction)vkShare:(id)sender {
    UIImage *image = [UIImage imageNamed:@"mem.png"];
    SHKItem *item = [SHKItem image:image title:@"Отличное приложение для iPhone, рекомендую!"];
    
    [SHKVkontakte shareItem:item];
}

- (IBAction)sendFeedback:(id)sender {
    if ([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        [controller setMailComposeDelegate:self];
        [controller setSubject:@"Обратная связь iOS-Mems"];
        [controller setToRecipients:[NSArray arrayWithObject:@"fuks.jacob.com@gmail.com"]];
        [controller setMessageBody:@"" isHTML:NO];
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        [self showAlertWithStatus:@"Устройство не обладает возможностью отправки электронной почты"];
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
