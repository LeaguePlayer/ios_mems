//
//  MEMemCategory.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEMemCategory.h"
#import "MEMem.h"

@implementation MEMemCategory

-(id)init{
    self = [super init];
    if (self){
        self.id = 0;
        self.name = @"";
        self.mainImage = [[UIImage alloc] init];
    }
    return self;
}

-(id)initWithName:(NSString *)name image:(UIImage *)image{
    self = [self init];
    if (self){
        self.name = name;
        self.mainImage = image;
    }
    return self;
}

+(NSArray *)allCategories{
    NSArray *names = [MEMemCategory categoryNames];
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i < 17; i++){
        NSMutableArray *images = [NSMutableArray array];
        int j = 0;
        NSString *file = [NSString stringWithFormat:@"%d_%d.png",i,j];
        UIImage *image = [UIImage imageNamed:file];
        UIImage *mainImage = image;
        while (image){
            MEMem *mem = [[MEMem alloc] initWithName:file id:j];
            [images addObject:mem];
            file = [NSString stringWithFormat:@"%d_%d.png",i,++j];
            image = [UIImage imageNamed:file];
        }
        MEMemCategory *category = [[MEMemCategory alloc] initWithName:[names objectAtIndex:i] image:mainImage];
        category.id = i;
        category.mems = images;
        [result addObject:category];
    }
    return result;
}

+(NSArray *)categoryNames{
    return @[@"Yeah",@"Trollface",@"Yao Ming",@"Faces",@"Facepalm",@"Oh God why",@"You don't say",@"Forever alone",@"Like a sir",@"Cereal guy",@"Me gusta",@"Freddie",@"Not bad",@"OMFG",@"PC user",@"True story",@"Angry dad"];
}

@end
