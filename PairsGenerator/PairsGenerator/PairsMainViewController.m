//
//  PairsMainViewController.m
//  PairsGenerator
//
//  Created by Justin Smith on 8/12/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "PairsMainViewController.h"

@interface PairsMainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PairsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [PairsController sharedInstance].array = [[PairsController sharedInstance].students mutableCopy];
    self.view.backgroundColor =  [UIColor colorWithRed:0.000f green:1.000f blue:0.590f alpha:1.00f]; //Light Green
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMeTheMoneyTapped:(id)sender
{
    [PairsController sharedInstance].array = [PairsController sharedInstance].students.mutableCopy;
    
    NSUInteger count = [PairsController sharedInstance].students.count;
    
    for (NSUInteger i = 0; i < count; ++i) {
        
        NSInteger remainingCount = count - i;
        
        NSInteger newIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        
        [[PairsController sharedInstance].array exchangeObjectAtIndex:i withObjectAtIndex:newIndex];
    }
    
    NSLog(@"Array outside random loop: %@", [PairsController sharedInstance].array);
    
    [[PairsController sharedInstance] save];
    [self.tableView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@", -/"];
    
    NSArray *nameArray = [textField.text componentsSeparatedByCharactersInSet:charSet];
    NSLog(@"%@", nameArray);
    
    for (NSString *string in nameArray) {
        NSLog(@"%@", string);
        [[PairsController sharedInstance] createStudentWith:string];
        [textField resignFirstResponder];
    }
    
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
