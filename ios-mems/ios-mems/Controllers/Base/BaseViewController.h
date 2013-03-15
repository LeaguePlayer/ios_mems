//
//  BaseViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)initInfoItemWithTarget:(BaseViewController *)target;
-(void)initPhotoItemWithTarget:(BaseViewController *)target;
-(void)initBackButtonWithTarget:(BaseViewController *)target;
-(void)initOptionsButtonWithTarget:(BaseViewController *)target;

-(void)leftItemClicked:(id)sender;
-(void)rightItemClicked:(id)sender;
-(void)showAlertWithStatus:(NSString *)title;
-(NSArray *)orderCollectionByTagWithArray:(NSArray *)array;
@end
