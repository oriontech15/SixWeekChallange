//
//  PairTableViewCell.h
//  PairsGenerator
//
//  Created by Justin Smith on 8/12/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PairTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftStudentLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightStudentLabel;

@end
