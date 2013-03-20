//
//  MEResizeCommand.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 18.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MECommand.h"

@interface METransformCommand : MECommand

@property (nonatomic) CGAffineTransform transform;

-(id)initWithView:(UIView *)view andScale:(CGAffineTransform)transform;

@end
