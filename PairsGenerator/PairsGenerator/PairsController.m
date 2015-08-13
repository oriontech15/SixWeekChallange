//
//  PairsController.m
//  PairsGenerator
//
//  Created by Justin Smith on 8/12/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "PairsController.h"
#import "Stack.h"

static NSString *allStudents = @"allStudents";

@implementation PairsController

+(PairsController *)sharedInstance
{
    static PairsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PairsController new];
    });
    
    return sharedInstance;
}

-(Student *)createStudentWith:(NSString *)name
{
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    student.studentName = name;
    return student;
}

-(NSArray *)students
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    NSError *error;
    
    NSArray *allStudents = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    if (&error) {
        NSLog(@"%@", error);
    }
    
    return allStudents;
}

-(void)save
{
    [[Stack sharedInstance].managedObjectContext save:nil];
}

-(void)removeStudent:(Student *)student
{
    [student.managedObjectContext deleteObject:student];
}

-(void)randomizeArrayFrom:(NSArray *)array
{
        
        self.array = [PairsController sharedInstance].students.mutableCopy;
        
        NSUInteger count = [PairsController sharedInstance].students.count;
        
        for (NSUInteger i = 0; i < count; ++i) {
            
            NSInteger remainingCount = count - i;
            
            NSInteger newIndex = i + arc4random_uniform((u_int32_t)remainingCount);
            
            [self.array exchangeObjectAtIndex:i withObjectAtIndex:newIndex];
        }
        
        [[PairsController sharedInstance] save];
        
};

@end
