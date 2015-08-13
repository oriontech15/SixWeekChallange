//
//  PairsController.h
//  PairsGenerator
//
//  Created by Justin Smith on 8/12/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface PairsController : NSObject

@property (nonatomic) NSMutableArray *array;

+(PairsController *)sharedInstance;

-(Student *)createStudentWith:(NSString *)name;
-(NSArray *)students;
-(void)randomizeArrayFrom:(NSArray *)array;
-(void)save;
-(void)removeStudent:(Student *)student;

@end
