//
//  MECommand.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 18.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MECommand : NSObject

@property (nonatomic, retain) UIView *view;
-(id)initWithView:(UIView *)view;
-(void)undo;
@end
