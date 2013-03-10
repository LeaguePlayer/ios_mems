//
//  MEMemCategory.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEMemCategory.h"

@implementation MEMemCategory

-(id)init{
    self = [super init];
    if (self){
        self.id = 0;
        self.name = @"";
        self.image = [[UIImage alloc] init];
    }
    return self;
}

-(id)initWithName:(NSString *)name image:(UIImage *)image{
    self = [self init];
    if (self){
        self.name = name;
        self.image = image;
    }
    return self;
}

+(NSArray *)categoriesMock{
    UIImage *image1 = [UIImage imageNamed:@"mem1.png"];
    UIImage *image2 = [UIImage imageNamed:@"mem2.png"];
    UIImage *image3 = [UIImage imageNamed:@"mem3.png"];
    MEMemCategory *car0 = [[MEMemCategory alloc] initWithName:@"Один" image:image1];
    MEMemCategory *car1 = [[MEMemCategory alloc] initWithName:@"Два" image:image2];
    MEMemCategory *car2 = [[MEMemCategory alloc] initWithName:@"Три" image:image3];
    MEMemCategory *car3 = [[MEMemCategory alloc] initWithName:@"Четыре" image:image1];
    MEMemCategory *car4 = [[MEMemCategory alloc] initWithName:@"Пять" image:image2];
    MEMemCategory *car5 = [[MEMemCategory alloc] initWithName:@"Шесть" image:image3];
    MEMemCategory *car6 = [[MEMemCategory alloc] initWithName:@"Семь" image:image1];
    MEMemCategory *car7 = [[MEMemCategory alloc] initWithName:@"Восемь" image:image2];
    MEMemCategory *car8 = [[MEMemCategory alloc] initWithName:@"Девять" image:image3];
    return @[car0,car1,car2,car3,car4,car5,car6,car7,car8];
}

@end
