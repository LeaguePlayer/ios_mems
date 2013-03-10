//
//  MEMem.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEMem.h"

@implementation MEMem

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

+(NSArray *)memsMock{
    UIImage *image1 = [UIImage imageNamed:@"mem1.png"];
    UIImage *image2 = [UIImage imageNamed:@"mem2.png"];
    UIImage *image3 = [UIImage imageNamed:@"mem3.png"];
    MEMem *mem0 = [[MEMem alloc] initWithName:@"Ололош" image:image2];
    MEMem *mem1 = [[MEMem alloc] initWithName:@"ФУУУ" image:image1];
    MEMem *mem2 = [[MEMem alloc] initWithName:@"Прочее" image:image1];
    MEMem *mem3 = [[MEMem alloc] initWithName:@"Три" image:image3];
    MEMem *mem4 = [[MEMem alloc] initWithName:@"Четыре" image:image3];
    MEMem *mem5 = [[MEMem alloc] initWithName:@"Пять" image:image2];
    MEMem *mem6 = [[MEMem alloc] initWithName:@"Окай" image:image2];
    MEMem *mem7 = [[MEMem alloc] initWithName:@"Дерпина" image:image1];
    MEMem *mem8 = [[MEMem alloc] initWithName:@"Дерп" image:image3];
    MEMem *mem9 = [[MEMem alloc] initWithName:@"Баттхерт" image:image1];
    MEMem *mem10 = [[MEMem alloc] initWithName:@"Лурк" image:image2];
    return @[mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7,mem8,mem9,mem10];
}

@end
