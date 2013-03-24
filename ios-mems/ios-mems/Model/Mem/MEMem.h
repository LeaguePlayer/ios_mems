//
//  MEMem.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavouriteMem.h"

@interface MEMem : NSObject

@property (nonatomic) int id;
@property (nonatomic,retain) NSString *fileName;

-(id)initWithName:(NSString *)fileName id:(int)id;
-(BOOL)isFavourite;
-(BOOL)isRecent;
-(void)addToFavourites;
-(void)removeFromFavourites;
-(void)addToRecent;
-(void)removeFromRecent;
+(id)memFromManagedOne:(FavouriteMem *)mem;

@end
