//
//  BaseNavigationController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 09.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    BaseNavigationTypeNormal,
    BaseNavigationTypeEditPhoto
} BaseNavigationType;

@interface BaseNavigationController : UINavigationController

-(void)initNavigationBarWithType:(BaseNavigationType)type;

@end
