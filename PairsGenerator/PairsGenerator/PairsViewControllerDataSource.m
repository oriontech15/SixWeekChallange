//
//  PairsViewControllerDataSource.m
//  PairsGenerator
//
//  Created by Justin Smith on 8/12/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "PairsViewControllerDataSource.h"
#import "PairTableViewCell.h"

@interface PairsViewControllerDataSource ()

@end

@implementation PairsViewControllerDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PairTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    [PairsController sharedInstance].array = [[NSMutableArray alloc]initWithArray:[PairsController sharedInstance].students];
    
    
    
    NSLog(@"Log Array: %@", [PairsController sharedInstance].array[indexPath.row]);
    
    
    cell.leftStudentLabel.text = [NSString stringWithFormat:@"%@", [[PairsController sharedInstance].array[indexPath.row * 2] valueForKey:@"studentName"]];
    cell.rightStudentLabel.text = [NSString stringWithFormat:@"%@", [[PairsController sharedInstance].array[(indexPath.row * 2) + 1] valueForKey:@"studentName"]];
//    NSString *left = [PairsController sharedInstance].array[indexPath.section * 2];
//    NSLog(@"LEFT LABEL: %@", left);
//    cell.leftStudentLabel.text = @"to";
//    cell.rightStudentLabel.text = [PairsController sharedInstance].array[(indexPath.section * 2) + 1];


    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [PairsController sharedInstance].students.count / 2;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
        //1. update the model
        Student *student1 = [PairsController sharedInstance].students[indexPath.row / 2];
        Student *student2 = [PairsController sharedInstance].students[indexPath.row / 2 + 1];
        [[PairsController sharedInstance] removeStudent:student1];
        [[PairsController sharedInstance] removeStudent:student2];
        [[PairsController sharedInstance] save];
        //2. reload the tableview or call one of the deleteRow methods
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
