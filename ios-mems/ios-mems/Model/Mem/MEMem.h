//
//  MEMem.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEMem : NSObject

@property (nonatomic) int id;
@property (nonatomic,retain) UIImage *image;
@property (nonatomic,retain) NSString *name;

-(id)initWithName:(NSString *)name image:(UIImage *)image;

+(NSArray *)memsMock;

@end
