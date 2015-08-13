//
//  StudentsList.h
//  PairsGenerator
//
//  Created by Justin Smith on 8/12/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString *studentName;

@end
