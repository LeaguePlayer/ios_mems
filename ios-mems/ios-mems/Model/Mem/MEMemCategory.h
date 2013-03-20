//
//  MEMemCategory.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEMemCategory : NSObject

@property (nonatomic) int id;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) UIImage *mainImage;
@property (nonatomic,retain) NSArray *mems;

-(id)initWithName:(NSString *)name image:(UIImage *)image;
+(NSArray *)allCategories;
+(NSArray *)categoryNames;

@end
