//
//  MEAddCommand.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEAddCommand.h"

@implementation MEAddCommand

-(void)undo{
    [self.view removeFromSuperview];
}

@end
