//
//  MemViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "MEMem.h"
#import <MessageUI/MFMessageComposeViewController.h>

@interface MemViewController : BaseViewController <MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,retain) MEMem *mem;
@property (weak, nonatomic) IBOutlet UIButton *favouriteBtn;
- (IBAction)toFavourite:(id)sender;
- (IBAction)sendMessage:(id)sender;
- (IBAction)saeImage:(id)sender;

@end
