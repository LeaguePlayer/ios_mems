//
//  AboutViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface AboutViewController : BaseViewController <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (IBAction)fbShare:(id)sender;
- (IBAction)vkShare:(id)sender;
- (IBAction)sendFeedback:(id)sender;
- (IBAction)rateApp:(id)sender;


@end
